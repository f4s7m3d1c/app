import 'package:fastmedic/models/sick.dart';
import 'package:fastmedic/providers/select_sick.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Symptoms extends StatelessWidget {
  final Sick sick;

  const Symptoms({super.key, required this.sick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<SelectSick>().onClick(sick),
      child: Card(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        shadowColor: Colors.black54,
        shape: context.watch<SelectSick>().state.selects.contains(sick)
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.redAccent.shade400, width: 3),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
        child: SizedBox(
          width: 160,
          height: 160,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      sick.toKorean(),
                      style: const TextStyle(
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
                      child: Image.asset(
                        sick.toImagePath(),
                        height: 70,
                        width: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
