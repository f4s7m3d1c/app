import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget{

  final String images;
  final String ConditionName;
  Symptoms({required this.images, required this.ConditionName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                blurRadius: 5.0,
                offset: const Offset(0,5),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child:
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(ConditionName,
                      style:
                      const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                      fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.scale(
                      scale: 3,
                      child: Image.asset(images,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}