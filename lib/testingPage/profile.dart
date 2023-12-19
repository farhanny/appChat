import 'package:flutter/material.dart';

import 'package:flutter_application_message/Pesan.dart';
import 'package:flutter_application_message/services/auth/auth_service.dart';
import 'package:flutter_application_message/smarthome.dart';
import 'package:provider/provider.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home(),
  ];
  final searchcontroller = SearchController();
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Account', style: TextStyle(color: Colors.white),),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFFEB6E4E),
          actions: [
            IconButton(onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));}, icon: Icon(Icons.ac_unit)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(Icons.chat)),

            //sign out button
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFEB6E4E),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(42),
                          bottomRight: Radius.circular(42)),
                      border: Border.all(width: 2, color: Color(0xFFEB6E4E))),
                  child: const ListTile(
                    title: Text(' Hello 👋 Tuan Fharhan!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/profile.jpg')),
                    subtitle: Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text(
                          'Padang, Sumatera Barat',
                          style: TextStyle(fontSize: 15, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: 20),

                //Widget Upgrade to Pro
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    decoration: ShapeDecoration(
                        shadows: [
                          BoxShadow(
                            color: Color(0x4FFF3D00).withOpacity(0.4),
                            blurRadius: 14,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                        color: Color(0xFF17CE92),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    padding: EdgeInsets.only(left: 10, bottom: 11, top: 11),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        title: const Text(
                          'Upgrade to Pro!',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.star,
                            color: Color(0xFFFCA82E),
                            size: 35,
                          ),
                          radius: 30,
                        ),
                        subtitle: Text(
                          'Enjoy all benefits unlock Feature',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitleTextStyle: TextStyle(
                          height: 1,
                        ),
                        trailing: Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(height: 20),
               Row(
                children: [
                  Text('     General', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Container(
                    height: 1,
                    width: 305,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  )
                ],
               ),
              // General Item
              ListTile(
                title: Text('E-Wallet', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.wallet, color: Colors.blue),
                trailing: Text('🪙 300 Coin', style: TextStyle(fontSize: 13),),
               ),
               ListTile(
                title: Text('Personal Info', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.person_4),
                trailing: Icon(Icons.keyboard_arrow_right),
               ),
               ListTile(
                title: Text('Security', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.security),
                trailing: Icon(Icons.keyboard_arrow_right),
               ),
                ListTile(
                title: Text('Language', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.language),
                trailing:  Icon(Icons.keyboard_arrow_right),
               ),
                 ListTile(
                title: Text('Dark Mode', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.remove_red_eye),
                trailing:  Icon(Icons.keyboard_arrow_right),
               ),
               SizedBox(height:10),
               Row(
                children: [
                  Text('     About', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Container(
                    height: 1,
                    width: 305,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  )
                ],
               ),

               ListTile(
                title: Text('Help Center', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.help),
                trailing:  Icon(Icons.keyboard_arrow_right),
               ),
                ListTile(
                title: Text('Privacy Policy', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: Icon(Icons.lock),
                trailing:  Icon(Icons.keyboard_arrow_right),
               ),
               ListTile(
                title: Text('About Chatty', style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600),),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/splash.png')),
                trailing:  Icon(Icons.keyboard_arrow_right),
               ),
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBarTheme(
            data: BottomNavigationBarThemeData(
                selectedItemColor: Color(0xFFEB6E4E)),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {setState(() {
                _currentIndex=index;
              });},
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.favorite_border,
                //     color: Colors.black,
                //   ),
                //   label: 'Saved',
                // ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined, color: Colors.black),
                    label: 'Chating'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.ac_unit, color: Colors.black),
                    label: 'Remote'),
              ],
            )));
  }
}
