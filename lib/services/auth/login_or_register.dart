import 'package:flutter/material.dart';
import 'package:flutter_application_message/login_page.dart';
import 'package:flutter_application_message/register_page.dart';

class loginOrRegister extends StatefulWidget {
  const loginOrRegister({super.key});

  @override
  State<loginOrRegister> createState() => _loginOrRegisterState();
}

class _loginOrRegisterState extends State<loginOrRegister> {

  //intially show the login screen
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    }
    else {
      return RegisterPage(onTap: togglePages);
    }
  }
}