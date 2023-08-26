import 'dart:convert';

import 'package:fastmedic/utils/assets.dart';
import 'package:fastmedic/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class MapDialog extends StatefulWidget{
  const MapDialog({super.key});

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {

  Future<void> getHospitals(NaverMapController controller, Position position) async {
    final Response response = await get(Uri.parse("https://nearbyhospitals.foundcake.kr/api/hospital?lat=${position.latitude}&lon=${position.longitude}"));
    if(response.statusCode != 200) {
      sendToast("error code is ${response.statusCode}");
      return;
    }
    Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
    final List hospitals = data["hospitals"];
    int id = 0;
    hospitals.forEach((hospital) {
      final marker = NMarker(
        id: "hospitals_$id",
        position: NLatLng(
          hospital["latitude"],
          hospital["longitude"],
        ),
      )..setOnTapListener((overlay) {
        overlay.setAlpha(0.7);
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hospital["name"],
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text("닫기"),
                        onPressed: () => Navigator.pop(dialogContext),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      });
      controller.addOverlay(marker);
      id++;
    });
  }

  Future<void> updateToCurrent(NaverMapController controller ) async {
    try{
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );
      getHospitals(controller, position);
      final latLng =  NLatLng(position.latitude, position.longitude);
      controller.updateCamera(NCameraUpdate.fromCameraPosition(
          NCameraPosition(
        target: latLng,
        zoom: 14,
      ))..setAnimation(
        animation: NCameraAnimation.none,
        duration: Duration.zero,
      ));
      final markerId = "user_location";
      final marker = NMarker(
        id: markerId,
        position: latLng,
        icon: const NOverlayImage.fromAssetImage(Assets.location),
      );
      controller.addOverlayAll({
        NCircleOverlay(
            id: "user_location_near",
            center: latLng,
            radius: 1200,
            color: Colors.lightBlueAccent.withAlpha(20),
            outlineColor: Colors.blue,
            outlineWidth: 1
        ),
        marker,
      });
      marker.openInfoWindow(NInfoWindow.onMarker(
        id: markerId,
        text: "현위치",
        alpha: 0.8,
      ));
    }catch(e){
      //NOPE
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: [
            NaverMap(
              options: const NaverMapViewOptions(
                  minZoom: 12,
                  activeLayerGroups: [
                    NLayerGroup.building,
                    NLayerGroup.traffic
                  ]
              ),
              onMapReady: (controller) {
                updateToCurrent(controller);
              },
            ),
            Positioned(
              top: 3,
              right: 3,
              child: IconButton(
                icon:  const Icon(
                  Icons.close_sharp,
                  size: 35,
                  weight: 10,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}