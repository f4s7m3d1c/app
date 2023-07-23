import 'package:fastmedic/elements/icon_text_button.dart';
import 'package:fastmedic/pages/map_dialog.dart';
import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget{
  const ResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const SingleChildScrollView(
                  child: Text(
                    "Chat GPT 답변",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconTextButton(
                    width: 120,
                    color: Colors.lightBlue,
                    icon: const Icon(
                      Icons.map_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                    text: const Text(
                      "주변 병원",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const MapDialog(),
                      );
                    },
                  ),
                  const SizedBox(width: 5,),
                  IconTextButton(
                    width: 75,
                    color: Colors.redAccent,
                    icon: const Icon(
                      Icons.call,
                      size: 25,
                      color: Colors.white,
                    ),
                    text: const Text(
                      "119",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("전화 연결을 하시겠습니까?"),
                          content: const Text("119에 전화가 연결됩니다."),
                          actions: [
                            TextButton(
                              child: const Text("예"),
                              onPressed: () {
                                //TODO: 전화 연결
                                Navigator.pop(context, true);
                              },
                            ),
                            TextButton(
                              child: const Text("아니요"),
                              onPressed: () => Navigator.pop(context, false),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}