import 'package:fastmedic/utils/assets.dart';
import 'package:flutter/material.dart';

AppBar backIconAppBar(BuildContext context)  => AppBar(
  backgroundColor: const Color(0xFFF3F3F3),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  leading: Padding(
    padding: const EdgeInsets.only(left: 10),
    child: InkWell(
      child: const Image(image: AssetImage(Assets.mini_icon),),
      onTap: () => Navigator.pop(context),
    ),
  ),
  elevation: 10,
  shadowColor: Colors.grey.shade200,
);