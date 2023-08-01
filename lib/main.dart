import 'dart:io';

import 'package:fastmedic/database/log_database.dart';
import 'package:fastmedic/env/env.dart';
import 'package:fastmedic/pages/response_page.dart';
import 'package:fastmedic/pages/select_sick_page.dart';
import 'package:fastmedic/providers/select_sick.dart';
import 'package:fastmedic/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  var hasError = false;
  await Geolocator.requestPermission();
  Database db = await openDatabase(
    "search_log.db",
    onOpen: (db) async {
      await db.execute(
          "CREATE TABLE IF NOT EXISTS `sick_search_db` ("
              "`id` INTEGER PRIMARY KEY AUTOINCREMENT," // id 자동 지정
              "`date` TEXT" // 날짜 시간 저장 (YYYY.MM.DD.HH.mm)
              "`sicks` TEXT," // 선택한 증상 저장
              "`desc` TEXT," // 세부 사항 저장
              "`result` TEXT" //결과값 저장
          ");"
      );
    },
  );
  LogDB.init(db);
  await NaverMapSdk.instance.initialize(
    clientId: Env.naver_map_key,
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
  FlutterNativeSplash.remove();
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
        themeMode: ThemeMode.light,
        title: "FastMedic",
        home: SelectSickPage(),
      ),
    );
  }
}