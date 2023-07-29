import 'package:fastmedic/utils/assets.dart';
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
      final latLng =  NLatLng(position.latitude, position.longitude);
      controller.updateCamera(NCameraUpdate.fromCameraPosition(
          NCameraPosition(
        target: latLng,
        zoom: 14,
      ))..setAnimation(
        animation: NCameraAnimation.none,
        duration: Duration.zero,
      ));
      final marker = NMarker(
        id: "user_location",
        position: latLng,
        icon: NOverlayImage.fromAssetImage(Assets.Location),
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
      final markerInfo = NInfoWindow.onMarker(
          id: marker.info.id,
          text: "현위치",
          offsetY: -20,
          alpha: 0.9
      );
      marker.setOnTapListener((overlay) => marker.openInfoWindow(markerInfo));
    }catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(5),
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
                icon: Icon(
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