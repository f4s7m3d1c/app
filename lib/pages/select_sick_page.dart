import 'package:fastmedic/pages/response_page.dart';
import 'package:flutter/material.dart';

class SelectSickPage extends StatelessWidget{
  const SelectSickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF3F3F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage("assets/mini.png"),
            ),
          ),
          elevation: 25,
          shadowColor: Colors.grey.shade200,
        ),
        body: Center(
          child: Column(
            children: [
              Text("main"),//TODO
            ],
          ),
        ),
      ),
    );
  }
}