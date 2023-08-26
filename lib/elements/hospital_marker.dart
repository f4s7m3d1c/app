import 'package:fastmedic/models/hospital.dart';
import 'package:fastmedic/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HospitalMarker extends NMarker {

  HospitalMarker({
    required BuildContext context,
    required String id,
    required NLatLng position,
    required Hospital hospital,
  }): super(
    id: id,
    position: position,
    alpha: hospital.hasER ? 1 : 0.8,
    size: hospital.hasER ? const Size(100, 100) : const Size(90, 90),
    icon: NOverlayImage.fromAssetImage(hospital.hasER ? Assets.emergency : Assets.hospital),
  ) {
    if(hospital.hasER) {
      setZIndex(300000);
    }
    setOnTapListener((overlay) {
      if(!hospital.hasER) {
        setAlpha(0.65);
        setZIndex(zIndex - 1);
      }
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            insetPadding: const EdgeInsets.all(35),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospital.name,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    height: 3,
                    color: hospital.hasER ? Colors.redAccent : Colors.lightGreen,
                  ),
                  const Text(
                    "시간표",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Center(
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FixedColumnWidth(60),
                        1: FixedColumnWidth(120)
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                            children: [
                              text("월요일"), text(hospital.timeMon),
                            ]
                        ),
                        TableRow(
                            children: [
                              text("화요일"), text(hospital.timeTue),
                            ]
                        ),
                        TableRow(
                            children: [
                              text("수요일"), text(hospital.timeWen),
                            ]
                        ),
                        TableRow(
                            children: [
                              text("목요일"), text(hospital.timeThu),
                            ]
                        ),
                        TableRow(
                            children: [
                              text("금요일"), text(hospital.timeFri),
                            ]
                        ),
                        TableRow(
                            children: [
                              text("토요일"), text(hospital.timeSat),
                            ]
                        ),
                        TableRow(
                            children: [
                              text("일요일"), text(hospital.timeSun),
                            ]
                        ),
                      ],
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
            ),
          );
        },
      );
    });
  }

  Text text(String text) => Text(
    text == "X" ? "휴진" : text,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontSize: 18
    ),
  );
}