import 'package:fastmedic/models/hospital.dart';
import 'package:fastmedic/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HospitalMarker extends NMarker {

  HospitalMarker({
    required String id,
    required NLatLng position,
    required Hospital hospital,
    required BuildContext context
  }): super(
    id: id,
    position: position,
    alpha: 0.9,
    icon: NOverlayImage.fromAssetImage(hospital.hasER ? Assets.emergency : Assets.hospital),
  ) {
    setOnTapListener((overlay) {
      overlay.setAlpha(0.7);
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  hospital.name,
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
  }
}