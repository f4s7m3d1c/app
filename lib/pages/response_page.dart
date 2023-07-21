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
        body: Center(
          child: Column(
            children: [
              Text("response"),
            ],
          ),
        ),
      ),
    );
  }
}