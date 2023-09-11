import 'package:fastmedic/pages/basic_app_bar.dart';
import 'package:fastmedic/pages/log_page.dart';
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
                Row(
                  children: [
                    Text('Fast Medic',
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    IconButton(
                        icon : Icon(Icons.file_copy_outlined),
                        color: Colors.black,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogPage()),
                          );
                        }
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                      SizedBox(
                        height: 40,
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
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            ConditionName: '화상',
                            images: 'assets/sick/Burns.jpg',
                          ),
                          Symptoms(
                            ConditionName: '기침',
                            images: 'assets/sick/cough.jpg',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Symptoms(
                            ConditionName: '발열',
                            images: 'assets/sick/fever.jpg',
                          ),
                          Symptoms(
                            ConditionName: '메스꺼움',
                            images: 'assets/sick/colic.jpg',
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
            decoration: BoxDecoration(
                color: Colors.grey.shade300
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
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
                          offset: const Offset(0,5),
                        ),
                      ],
                    ),
                    width: 310,
                    child:
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                        ),
                        Text('입력',
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ResponsePage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 5.0,
                              offset: const Offset(0,5),
                            ),
                          ],
                        ),
                        width: 310,
                        child:
                        Row(
                          
                          children: [
                            SizedBox(
                              width: 120,
                            ),
                            Text('선택',
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

