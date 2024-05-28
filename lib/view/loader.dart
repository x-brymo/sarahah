import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:lottie/lottie.dart';
import 'package:sarahah/view/start.dart';

class LoaderScreen extends StatefulWidget {
   LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
 bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10),(){ 
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => StartingScreen()), (route) => false);
  });}
  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       //? https://assets6.lottiefiles.com/packages/lf20_uz92k22x.json
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Expanded(
                          child:isLoaded ? CircularProgressIndicator()
                           : Lottie.network('https://lottie.host/5518bc1e-5ca3-4c8f-8587-750df9d1c8c8/LvYlgwngVy.json',),
              ),
            ),
          ),
        ],  
      ),
    );
  }
}