import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key,
  required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 250, 137, 71),
      ),
      child: Column(
        children: [
          Text(message, style : TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}