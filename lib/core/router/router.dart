// genrate router app 
import 'package:flutter/material.dart';
import 'package:sarahah/view/loader.dart';

import '../../view/login.dart';
import '../../view/start.dart';

class Routers{
    static const String loginRoute = '/login';
 static const String startRoute = '/starting';
 static const String loaderRoute = '/loader';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loaderRoute:
        return MaterialPageRoute(builder: (context) => LoaderScreen());
      case startRoute:
        return MaterialPageRoute(builder: (context) => StartingScreen());
      case  loginRoute :
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) => StartingScreen());
    }
  }
}