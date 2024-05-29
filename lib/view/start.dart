import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';
import 'package:sarahah/view/login.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          50.asSizeBoxHeight,
          const Center(
            child: Text(
              "                   Welcome To Sarahah \n"
                             
              "     you can send any message to Sarahah ", style: TextStyle(fontSize: 16),),
          ),
          30.asSizeBoxHeight,
          TextButton(
            
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(const Size(200, 50)),
              backgroundColor: WidgetStateProperty.all(const Color(0xff13CB4E)),
            ), child: const Text("Starting", style: TextStyle(color: Colors.white),),
          ),
          
        ])
    );
  }
}