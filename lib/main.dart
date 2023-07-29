import 'dart:io';

import 'package:fastmedic/database/log_database.dart';
import 'package:fastmedic/pages/response_page.dart';
import 'package:fastmedic/pages/select_sick_page.dart';
import 'package:fastmedic/providers/select_sick.dart';
import 'package:fastmedic/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var hasError = false;
  await Geolocator.requestPermission();
  Database db = await openDatabase("search_log.db");
  LogDB.init(db);
  await NaverMapSdk.instance.initialize(
    clientId: "YOUR_ID",
    onAuthFailed: (ex) {
      sendToast("Error: ${ex.code}");
      hasError = true;
    }
  ).timeout(
    const Duration(seconds: 10),
    onTimeout: () {
      sendToast("네트워크를 확인해 주세요");
      hasError = true;
    },
  );
  if(hasError){
    if(Platform.isIOS){
      db.close();
      exit(0);
    }else{
      SystemNavigator.pop();
    }
  }else {
    runApp(const MyApp());
  }
  db.close();
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectSick>(create: (context) => SelectSick(),),
      ],
      child: const MaterialApp(
        title: "FastMedic",
        home: SelectSickPage(),
      ),
    );
  }
}