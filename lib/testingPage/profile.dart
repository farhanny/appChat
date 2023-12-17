import 'package:flutter/material.dart';

import 'package:flutter_application_message/component/searchingbar.dart';
import 'package:flutter_application_message/Pesan.dart';
import 'package:flutter_application_message/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
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
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFFEB6E4E),
          actions: [
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
                        backgroundImage: NetworkImage(
                            'https://cdn.idntimes.com/content-images/post/20230515/gambar-profil-wa-keren-41d3732660868cf4a36d801d1301f672.jpg')),
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
                MySeachBar(
                    controller: searchcontroller,
                    hinText: 'Cari disini...',
                    obscureText: false),
                // SearchBar2(
                //     controller: searchcontroller,
                //     hinText: 'Cari Disini...',
                //     obscureText: false,
                //     prefixIcon: Icon(Icons.search),
                //     suffixIcon: null),

                SizedBox(height: 30),
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
                    padding: EdgeInsets.only(left: 10, bottom: 16, top: 16),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        title: const Text(
                          'Upgrade to Pro!',
                          style: TextStyle(
                              fontSize: 22,
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
                          'Enjoy all benefits without restrictions',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitleTextStyle: TextStyle(
                          height: 1.5,
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
                  Text('    General', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                  Container(
                    height: 1,
                    width: 315,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  )
                ],
               )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBarTheme(
            data: BottomNavigationBarThemeData(
                selectedItemColor: Color(0xFFEB6E4E)),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined, color: Colors.black),
                    label: 'Chating'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.black),
                    label: 'profile'),
              ],
            )));
  }
}
