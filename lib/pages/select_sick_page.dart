import 'package:fastmedic/elements/symptoms.dart';
import 'package:fastmedic/models/sick.dart';
import 'package:fastmedic/pages/log_page.dart';
import 'package:fastmedic/pages/response_page.dart';
import 'package:fastmedic/utils/assets.dart';
import 'package:flutter/material.dart';

class SelectSickPage extends StatelessWidget {
  const SelectSickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          title: Container(
            //검색창 UI
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.mini_icon,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Fast Medic',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    IconButton(
                        icon: const Icon(Icons.file_copy_outlined),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogPage()),
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            sick: Sick.headache,
                          ),
                          Symptoms(
                            sick: Sick.dyspnoea,
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            sick: Sick.blister,
                          ),
                          Symptoms(sick: Sick.congestion),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            sick: Sick.burns,
                          ),
                          Symptoms(
                            sick: Sick.cough,
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            sick: Sick.fever,
                          ),
                          Symptoms(
                            sick: Sick.nausea,
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            sick: Sick.stomachache,
                          ),
                          Symptoms(
                            sick: Sick.convulsion,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          blurRadius: 5.0,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    width: 310,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 120,
                        ),
                        Text(
                          '입력',
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResponsePage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 5.0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      width: 310,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Text(
                            '선택',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
