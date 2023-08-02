import 'package:fastmedic/utils/assets.dart';
import 'package:flutter/material.dart';

final AppBar BasicAppBar = AppBar(
  backgroundColor: const Color(0xFFF3F3F3),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  leading: const Padding(
    padding: EdgeInsets.only(left: 10),
    child: Image(
      image: AssetImage(Assets.mini_icon),
    ),
  ),
  elevation: 10,
  shadowColor: Colors.grey.shade200,
);