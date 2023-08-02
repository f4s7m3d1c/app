import 'package:fastmedic/elements/chat_box.dart';
import 'package:fastmedic/elements/icon_text_button.dart';
import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:fastmedic/pages/dialog/map_dialog.dart';
import 'package:fastmedic/providers/select_sick.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsePage extends StatelessWidget{
  const ResponsePage({super.key});

  Future<String> callChatGPT(SelectSick selectSick) async {
    await Future.delayed(Duration(seconds: 1));
    selectSick.clear();
    return "ChatGPT 답변";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Colors.grey.shade200,
                  child: FutureBuilder(
                    future: callChatGPT(context.read<SelectSick>()),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AI 응답 대기 중...",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 5,),
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: CircularProgressIndicator(
                                  strokeWidth: 7,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Row(
                            children: [
                              //TODO: ai icon
                              ChatBox(
                                text: "Chat GPT 답변\n",
                                textStyle: TextStyle(
                                    fontSize: 18
                                ),
                                color: Colors.lightGreen.shade100,
                              )
                            ],
                          ),
                        ),
                      );
                    },
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