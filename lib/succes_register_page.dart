import 'package:flutter/material.dart';
import 'package:flutter_application_message/component/my_button2.dart';
import 'package:flutter_application_message/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SuccessRegister extends StatefulWidget {
  const SuccessRegister({super.key});

  @override
  State<SuccessRegister> createState() => _MyWidSuccessRegister();
}

class _MyWidSuccessRegister extends State<SuccessRegister> {
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: Color(0xFFEB6E4E), elevation: 0))
          .copyWith(
        scaffoldBackgroundColor: Color(0xFFEB6E4E),
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            //sign out button
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100),
              Image(
                image: AssetImage('assets/succes.jpg'),
                height: 220,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome !  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  Text(
                    'Fharhan Novriusmen',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Congratulations! You’re now part of the',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 1.5),
              Text(
                ' Chatty Comunity. Let’s Chat with Our',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 1.5),
              Text(
                'Comunity now.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: MyButton2(text: ' Chat Now', image: AssetImage('assets/splash.png')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
