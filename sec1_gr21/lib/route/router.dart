import 'package:flutter/material.dart';
import 'screen_exports.dart';
import 'route_constant.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomepageRoute:
      return MaterialPageRoute(builder: (context) => Welcomepage());
    case loginpageRoute:
      return MaterialPageRoute(builder: (context) => Loginpage());
    case homepageRoute:
      return MaterialPageRoute(builder: (context) => Homepage());
    case registerpageRoute:
      return MaterialPageRoute(builder: (context) => Registerpage());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
