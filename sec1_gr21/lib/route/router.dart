import 'package:flutter/material.dart';
import 'screen_exports.dart';
import 'route_constant.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomepageRoute:
      return MaterialPageRoute(builder: (context) => WelcomePage());

    case loginpageRoute:
      return MaterialPageRoute(builder: (context) => Loginpage());

    case homepageRoute:
      return MaterialPageRoute(builder: (context) => Homepage());

    case registerpageRoute:
      return MaterialPageRoute(builder: (context) => Registerpage());

    case profilepageRoute:
      return MaterialPageRoute(builder: (context) => ProfilePage());

    case editprofilepageRoute:
      return MaterialPageRoute(builder: (context) => EditProfilePage());

    case findjobpageRoute:
      return MaterialPageRoute(builder: (context) => FindJobPage());

    case hirejobpageRoute:
      return MaterialPageRoute(builder: (context) => HireJobPage());

    case learnnewthingpageRoute:
      return MaterialPageRoute(builder: (context) => learnnewthingPage());

    case courseinfoRoute:
      return MaterialPageRoute(builder: (context) => CourseinfoPage());

    case chatpageRoute:
      return MaterialPageRoute(builder: (context) => ChatPage());

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
