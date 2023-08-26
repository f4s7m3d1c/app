import 'dart:convert';

import 'package:fastmedic/elements/hospital_marker.dart';
import 'package:fastmedic/models/hospital.dart';
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
    final List<HospitalMarker> markers = [];
    hospitals.forEach((hospital) {
      markers.add(HospitalMarker(
        context: context,
        id: "hospitals_$id",
        position: NLatLng(
          hospital["latitude"],
          hospital["longitude"],
        ),
        hospital: Hospital(
          name: hospital["name"],
          hasER: hospital["hasER"],
          timeMon: hospital["openTime"]["mon"],
          timeTue: hospital["openTime"]["tue"],
          timeWen: hospital["openTime"]["wen"],
          timeThu: hospital["openTime"]["thu"],
          timeFri: hospital["openTime"]["fri"],
          timeSat: hospital["openTime"]["sat"],
          timeSun: hospital["openTime"]["sun"],
        ),
      ));
      id++;
    });
    controller.addOverlayAll(markers.toSet());
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
        size: Size(100, 100),
        icon: const NOverlayImage.fromAssetImage(Assets.location),
      )..setGlobalZIndex(500000);
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
        offsetY: -25
      ));
    }catch(e){
      //NOPE
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
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