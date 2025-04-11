import 'package:flutter/material.dart';
import 'screen_exports.dart';
import 'route_constant.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

final ThemeManager themeManager = ThemeManager();
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomepageRoute:
      return MaterialPageRoute(builder: (context) => WelcomePage());

    case loginpageRoute:
      return MaterialPageRoute(builder: (context) => Loginpage());

    case homepageRoute:
      return MaterialPageRoute(
          builder: (context) => Homepage(themeManager: themeManager));

    case registerpageRoute:
      return MaterialPageRoute(builder: (context) => Registerpage());

    case profilepageRoute:
      return MaterialPageRoute(
          builder: (context) => ProfilePage(themeManager: themeManager));

    case editprofilepageRoute:
      return MaterialPageRoute(
          builder: (context) => EditProfilePage(themeManager: themeManager));

    case findjobpageRoute:
      return MaterialPageRoute(
          builder: (context) => FindJobPage(themeManager: themeManager));

    case hirejobpageRoute:
      return MaterialPageRoute(
          builder: (context) => HireJobPage(themeManager: themeManager));

    case learnnewthingpageRoute:
      return MaterialPageRoute(
          builder: (context) => learnnewthingPage(themeManager: themeManager));

    case chatpageRoute:
      return MaterialPageRoute(
          builder: (context) => ChatPage(themeManager: themeManager));

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
