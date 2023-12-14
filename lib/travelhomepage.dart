import 'package:flutter/material.dart';

import 'package:flutter_application_message/component/searchingbar.dart';
import 'package:flutter_application_message/home_page.dart';
import 'package:flutter_application_message/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
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
                Container(decoration: BoxDecoration(color: Color(0xFFEB6E4E),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(42), bottomRight: Radius.circular(42)), border: Border.all(width: 2, color:Color(0xFFEB6E4E) )),
                  child: const ListTile(
                    title: Text(' Hello 👋 Tuan Fharhan!',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
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
                MySeachBar(controller: searchcontroller, hinText: 'Cari Disini', obscureText: false),
                // SearchBar2(
                //     controller: searchcontroller,
                //     hinText: 'Cari Disini...',
                //     obscureText: false,
                //     prefixIcon: Icon(Icons.search),
                //     suffixIcon: null),

                SizedBox(height: 20),
                ListTile(
                  title: const Text(
                    'Discover Places :',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://cdn.idntimes.com/content-images/post/20230515/gambar-profil-wa-keren-41d3732660868cf4a36d801d1301f672.jpg')),
                  title: const Text(
                    'Universitas Andalas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('ini adalah subtitle nya'),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  trailing: Icon(Icons.arrow_right),
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://cdn.idntimes.com/content-images/post/20230515/gambar-profil-wa-keren-41d3732660868cf4a36d801d1301f672.jpg')),
                  title: const Text(
                    'SMA 2 Padang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('ini adalah subtitle nya'),
                ),
                ListTile(
                  trailing: Icon(Icons.arrow_right),
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://cdn.idntimes.com/content-images/post/20230515/gambar-profil-wa-keren-41d3732660868cf4a36d801d1301f672.jpg')),
                  title: const Text(
                    'SMP 2 Padang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('ini adalah subtitle nya'),
                ),
                ListTile(
                  trailing: Icon(Icons.arrow_right),
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://cdn.idntimes.com/content-images/post/20230515/gambar-profil-wa-keren-41d3732660868cf4a36d801d1301f672.jpg')),
                  title: const Text(
                    'SD Negeri 2 Padang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('ini adalah subtitle nya'),
                ),

                // Row(
                //   children: [
                //     SizedBox(width: 20),
                //     SizedBox(
                //       child: Text(
                //         'Hello 👋 Fharhan',
                //         style:
                //             TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                //         textAlign: TextAlign.left,
                //       ),
                //     ),
                //   ],
                // )
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
