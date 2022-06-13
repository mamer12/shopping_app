import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/auth_screen.dart';

Route<dynamic> genrateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => AuthScreen());
    default:
      return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const Scaffold(
                body: Text('Page Not Found'),
              ));
  }
}
