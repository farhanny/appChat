import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_message/model/message.dart';

class ChatService extends ChangeNotifier {
  //get instance of auth and firestore

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String currentPengguna = _firebaseAuth.currentUser!.displayName.toString();
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp,
        namaPengguna: currentPengguna);
    //construct chat room id from current user id and receiver id (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sort the ids (this ensure the chat room id is always the same for any pair of )
    String chatRoomId = ids.join('_'); //combine the ids into a single String to use as a chatroomID

    //add new meesage to database
    await _firestore
        .collection('Chat_Room')
        .doc(chatRoomId)
        .collection('Message')
        .add(newMessage.toMap());
  }

  //GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct chat room id from user ids (sorted to ensure it matches the id used when sending messages)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firestore
        .collection('Chat_Room')
        .doc(chatRoomId)
        .collection('Message')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
