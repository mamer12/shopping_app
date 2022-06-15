import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/bottom_bar.dart';
import 'package:shopping_app/features/admin/screens/add_product_screen.dart';
import 'package:shopping_app/features/auth/screens/auth_screen.dart';
import 'package:shopping_app/features/home/screens/home_screen.dart';

Route<dynamic> genrateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const BottomBar());
    case AddProductScreen.routName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const AddProductScreen());
    default:
      return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const Scaffold(
                body: Text('Page Not Found'),
              ));
  }
}
