import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_message/component/chat_bubble.dart';
import 'package:flutter_application_message/component/text_field_message.dart';
import 'package:flutter_application_message/services/auth/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //omly send message if something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      //clear the text controler after sending message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF19F6D),
      appBar: AppBar(
        backgroundColor: Color(0xFFF19F6D),
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          //messages
          Expanded(child: _buildMessageList()),

          //user input
          _buildMessageInput(),
        ],
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading..');
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //Allign the message to the right if the sender is the current user, otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: 
          (data['senderId'] == _firebaseAuth.currentUser!.uid)
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
          mainAxisAlignment:
           (data['senderId'] == _firebaseAuth.currentUser!.uid)
           ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            // Text(data['senderEmail']),
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  //message message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        //texfield
        Expanded(
          child: MyTextField2(
            controller: _messageController,
            hinText: 'Enter Message',
            obscureText: false,
          ),
        ),

        //send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(
            Icons.send_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
