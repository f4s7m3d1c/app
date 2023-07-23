import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MapDialog extends StatefulWidget{
  const MapDialog({super.key});

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {

  Future<void> updateToCurrent(NaverMapController controller ) async {
    try{
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );
      controller.updateCamera(NCameraUpdate.fromCameraPosition(
          NCameraPosition(
        target: NLatLng(position.latitude, position.longitude),
        zoom: 15,
      ))..setAnimation(
        animation: NCameraAnimation.none,
        duration: Duration.zero,
      ));
    }catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Expanded(
            child: NaverMap(
              options: const NaverMapViewOptions(
                  contentPadding: EdgeInsets.all(5),
                  initialCameraPosition: NCameraPosition(
                    target: NLatLng(37.574187, 126.976882,),
                    zoom: 15,
                  ),
                  minZoom: 13,
                  activeLayerGroups: [
                    NLayerGroup.building,
                    NLayerGroup.traffic
                  ]
              ),
              onMapReady: (controller) {
                print("맵 로딩됨!");
                updateToCurrent(controller);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text("닫기"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          )
        ],
      ),
    );
  }
}