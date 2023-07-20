import 'package:fastmedic/pages/select_sick_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FastMedic",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const SelectSickPage(),
    );
  }
}