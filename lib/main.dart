import 'package:fastmedic/pages/select_sick_page.dart';
import 'package:fastmedic/providers/SelectSick.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectSick>(create: (context) => SelectSick(),),
      ],
      child: MaterialApp(
        title: "FastMedic",
        home: const SelectSickPage(),
      ),
    );
  }
}