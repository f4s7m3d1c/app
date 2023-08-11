import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:fastmedic/pages/response_page.dart';
import 'package:flutter/material.dart';

class SelectSickPage extends StatelessWidget{
  const SelectSickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar,
        body: Center(
          child: Column(
            children: [
              Text("main"),//TODO
              Text('ㅁㄴㅇㄹ'),
            ],
          ),
        ),
      ),
    );
  }
}