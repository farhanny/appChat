import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_message/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign user out
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Kontak Saya'),
        actions: [
          //sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body:_buildUserList(),
    );
  }

//build a list of users except for the current logged in your user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

//build individual user list items

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current user
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text( data['email']),
        onTap: () {
          //pass the clicked user's UID to the chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      //return empty container
      return Container();
    }
  }
}