import 'package:fastmedic/elements/icon_text_button.dart';
import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget{
  const ResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("response"),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconTextButton(
                        width: 120,
                        color: Colors.lightBlue,
                        icon: const Icon(
                          Icons.map_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                        text: const Text(
                          "지도 보기",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        onPressed: () {

                        },
                      ),
                      const SizedBox(width: 5,),
                      IconTextButton(
                        width: 75,
                        color: Colors.redAccent,
                        icon: const Icon(
                          Icons.call,
                          size: 25,
                          color: Colors.white,
                        ),
                        text: const Text(
                          "119",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}