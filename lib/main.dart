import 'dart:io';

import 'package:fastmedic/pages/response_page.dart';
import 'package:fastmedic/pages/select_sick_page.dart';
import 'package:fastmedic/providers/SelectSick.dart';
import 'package:fastmedic/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var hasError = false;
  await NaverMapSdk.instance.initialize(
    clientId: "YOUR_ID",
    onAuthFailed: (ex) {
      sendToast("Error: ${ex.code}");
      hasError = true;
    }
  );
  if(hasError){
    if(Platform.isIOS){
      exit(0);
    }else{
      SystemNavigator.pop();
    }
  }else{
    runApp(const MyApp());
  }
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