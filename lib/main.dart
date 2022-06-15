import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/common/widgets/bottom_bar.dart';
import 'package:shopping_app/constatns/global_var.dart';
import 'package:shopping_app/features/auth/screens/auth_screen.dart';
import 'package:shopping_app/features/auth/services/auth_service.dart';
import 'package:shopping_app/provieders/user_provider.dart';
import 'package:shopping_app/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

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
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const BottomBar()
            : const AuthScreen());
  }
}
