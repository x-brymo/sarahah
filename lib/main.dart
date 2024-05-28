import 'package:flutter/material.dart';

import 'core/config/handdler_color.dart';
import 'view/loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sarahah',
      theme: ThemeData(

        primarySwatch: buildMaterialColor(Color(0xff13CB4E)),
       
        
      ),
      debugShowCheckedModeBanner: false,
      home:  LoaderScreen(),
    );
  }
}