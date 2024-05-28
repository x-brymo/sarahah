import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          100.asSizeBoxHeight,
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Expanded(
                          child:
                            Lottie.network('https://lottie.host/2ef111a0-d6a4-455d-a8f9-904965fb7216/kFlnuKgzJK.json',),
              ),
            ),
          ),
          100.asSizeBoxHeight,
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Text("Welcome To Sarahah \n ", style: TextStyle(fontSize: 30),),
            ),
          ),
        ])
    );
  }
}