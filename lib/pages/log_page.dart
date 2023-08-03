import 'package:fastmedic/database/log_database.dart';
import 'package:fastmedic/models/log.dart';
import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:fastmedic/providers/log_list.dart';
import 'package:fastmedic/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogCard extends StatelessWidget{
  final Log log;

  const LogCard({super.key, required this.log});

  List<Widget> post(String title, String content) => [
    Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    Text(
      content,
      style: const TextStyle(
        fontSize: 18,
      ),
    ),
    const SizedBox(height: 5,),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15
      ),
      color: const Color(0xFFF3F3F3) ,
      shadowColor: Colors.black,
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dot2kor(log.date),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 35,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        icon: const Icon(Icons.warning),
                        title: const Text("경고"),
                        content: const Text("정말로 삭제하시겠습니까?"),
                        actions: [
                          TextButton(
                            child: const Text("예"),
                            onPressed: () {
                              context.read<LogList>().removeLog(log);
                              Navigator.pop(context, true);
                            },
                          ),
                          TextButton(
                            child: const Text("아니요"),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          ...post("증상", log.keywords),
          if(log.description.isNotEmpty)
            ...post("세부 설명", log.description),
          ...post("결과", log.result),
        ],
      ),
    );
  }
}

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  Future<void> loadLogs(LogList provider) async {
    List<Log> logs = await LogDB.instance.getLogs();
    provider.setLogs(logs);
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if(!context.watch<LogList>().state.isLoaded){
      loadLogs(context.read<LogList>());
      content = const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "데이터를 불러오는 중...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            CircularProgressIndicator()
          ],
        ),
      );
    } else {
      List<Log> logs = context.watch<LogList>().state.logs;
      content = ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) => LogCard(log: logs[index]),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar,
        body: content,
      ),
    );
  }
}