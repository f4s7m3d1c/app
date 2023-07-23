import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MapDialog extends StatefulWidget{
  const MapDialog({super.key});

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {

  NLatLng position = const NLatLng(37.574187, 126.976882,);

  @override
  void initState() {
    super.initState();
    () async {
      try{
         Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
        );
         setState(() {
           this.position = NLatLng(position.latitude, position.longitude);
         });
      }catch(e){}
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                    target: position,
                    zoom: 13 ,
                  ),
                  minZoom: 10,
                ),
                onMapReady: (controller) {
                  print("맵 로딩됨!");
                },
              ),
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