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
          width: 150,
          height: 150,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ConditionName,
                  style:
                  const TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 20,
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