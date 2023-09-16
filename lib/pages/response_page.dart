import 'package:fastmedic/elements/chat_box.dart';
import 'package:fastmedic/elements/icon_text_button.dart';
import 'package:fastmedic/models/log.dart';
import 'package:fastmedic/models/sick.dart';
import 'package:fastmedic/pages/app_bar.dart';
import 'package:fastmedic/pages/dialog/map_dialog.dart';
import 'package:fastmedic/providers/log_list.dart';
import 'package:fastmedic/providers/select_sick.dart';
import 'package:fastmedic/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsePage extends StatelessWidget{
  const ResponsePage({super.key});

  Future<String> _callChatGPT(List<Sick> selects) async {
    String response = await Future.delayed(const Duration(seconds: 1)).then((value) => "ChatGPT 답변");
    return response;
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot<String> snapshot) {
    if(snapshot.hasError) {
      WidgetsBinding.instance.addPostFrameCallback((_) => context.read<SelectSick>().clear());
    }
    if(!snapshot.hasData) {
      return const Center(
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
    } else {
      SelectSickState state = context.read<SelectSick>().state;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<SelectSick>().clear();
        context.read<LogList>().addLog(Log.create(
          keywords: state.selects,
          description: state.description,
          result: snapshot.requireData,
        ));
      });
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            const  SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: AssetImage(Assets.ai_icon),
              ),
            ),
            ChatBox(
              text: "Chat GPT 답변\n",
              textStyle: const TextStyle(
                  fontSize: 18
              ),
              color: Colors.lightGreen.shade100,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: backIconAppBar(context),
        body: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.grey.shade200,
                    margin: const EdgeInsets.all(1),
                    child: FutureBuilder(
                      future: _callChatGPT(context.read<SelectSick>().state.selects),
                      builder: _buildFuture,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20,),
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
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}