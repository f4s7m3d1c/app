import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:fastmedic/pages/response_page.dart';
import 'package:flutter/material.dart';
import 'package:fastmedic/elements/SymptomsContainer.dart';

class SelectSickPage extends StatelessWidget {
  const SelectSickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          backgroundColor: Colors.white,
          title:
          Container( //검색창 UI
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/sick/fastmedic.jpg',
                  width: 40, height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Row(
                  children: [
                    Text('Fast Medic',
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 170,
                    ),
                    Text('log',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Symptoms(
                    ConditionName: '두통',
                    images: 'assets/sick/Headache.jpg',
                  ),
                  Symptoms(
                    ConditionName: '호흡',
                    images: 'assets/sick/breath.jpg',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Symptoms(
                    ConditionName: '물집',
                    images: 'assets/sick/blister.jpg',
                  ),
                  Symptoms(
                    ConditionName: '충혈',
                    images: 'assets/sick/congestion.jpg',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Symptoms(
                    ConditionName: '두통',
                    images: 'assets/sick/Headache.jpg',
                  ),
                  Symptoms(
                    ConditionName: '두통',
                    images: 'assets/sick/Headache.jpg',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Symptoms(
                    ConditionName: '두통',
                    images: 'assets/sick/Headache.jpg',
                  ),
                  Symptoms(
                    ConditionName: '두통',
                    images: 'assets/sick/Headache.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
