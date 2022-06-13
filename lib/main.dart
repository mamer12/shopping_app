import 'package:flutter/material.dart';
import 'package:shopping_app/constatns/global_var.dart';
import 'package:shopping_app/features/auth/auth_screen.dart';
import 'package:shopping_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping app',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 3,
                iconTheme:
                    IconThemeData(color: GlobalVariables.secondaryColor))),
        onGenerateRoute: (settings) => genrateRoute(settings),
        home: AuthScreen());
  }
}
