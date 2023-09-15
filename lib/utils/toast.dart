import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

void sendToast(String message) => Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color(0xff6E6E6E),
    toastLength: Toast.LENGTH_LONG);
