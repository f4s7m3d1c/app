import 'package:fastmedic/database/log_database.dart';
import 'package:fastmedic/models/log.dart';
import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:flutter/material.dart';

class LogCard extends StatelessWidget{
  final Log log;

  const LogCard({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                log.date
              )
            ],
          )
        ],
      ),
    );
  }
}

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar,
        body: Center(
          child: FutureBuilder(
            future: LogDB.instance.getLogs(),
            builder: (context, snapshot) {
              if(snapshot.data == null) {
                return const Column(
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
                );
              } else {
                List<Log> logs = snapshot.data!;
                return ListView.builder(
                  itemCount: logs.length,
                  itemBuilder: (context, index) => LogCard(log: logs[index]),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}