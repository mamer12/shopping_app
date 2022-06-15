import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/custom_button.dart';
import 'package:shopping_app/common/widgets/custom_textField.dart';
import 'package:shopping_app/features/auth/services/auth_service.dart';

import '../../../constatns/global_var.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFromKey = GlobalKey<FormState>();
  final _signinFromKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signUpFromKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _nameController, hintText: "Name"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _emailController, hintText: "email"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _passwordController,
                          hintText: "Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Sign up",
                          onTap: () {
                            if (_signUpFromKey.currentState!.validate()) {
                              signUpUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              title: const Text(
                'Sign in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signinFromKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _emailController, hintText: "email"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _passwordController,
                          hintText: "Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Sign in",
                          onTap: () {
                            if (_signinFromKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}