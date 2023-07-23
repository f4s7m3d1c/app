import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapDialog extends StatefulWidget{
  const MapDialog({super.key});

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> {

  @override
  void initState() {
    super.initState();
    () async {

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
                options: const NaverMapViewOptions(
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