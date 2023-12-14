import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_message/services/auth/login_or_register.dart';
import 'package:flutter_application_message/succes_register_page.dart';



class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return const SuccessRegister();
          }

          //user is NOT Logged in
          else {
            return const loginOrRegister();
          }



        },
      ),
    );
  }
}