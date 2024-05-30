import 'package:flutter/material.dart';

import 'core/config/handdler_color.dart';
import 'core/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sarahah',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: getMaterialColor(),
      ),
      initialRoute: Routers.loaderRoute,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
