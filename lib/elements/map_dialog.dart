import 'package:fastmedic/math/vector2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MapDialog extends StatefulWidget{
  const MapDialog({super.key});

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {

  Vector2 position = const Vector2(x: 37.574187, y: 126.976882,);

  @override
  void initState() {
    super.initState();
    () async {
      try{
         Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
        );
         setState(() {
           this.position = Vector2(
             x: position.latitude,
             y: position.longitude,
           );
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
                    target: NLatLng(position.x, position.y),
                    zoom: 10,
                  ),
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