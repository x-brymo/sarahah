import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Lottie.asset('assets/lottie/loader.json', fit: BoxFit.fill, reverse: true,
                repeat: true, animate: true,
              ),
            ),
            
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
            ),
          ],
        ),
      )
    );
  }
}