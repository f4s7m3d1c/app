import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:fastmedic/pages/response_page.dart';
import 'package:flutter/material.dart';
import 'package:fastmedic/extensions/SymptomsContainer.dart';

class SelectSickPage extends StatelessWidget {
  const SelectSickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar,
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
