import 'package:flutter/material.dart';
import 'package:flutter_application_message/camera/mainscreen.dart';

class MyTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final bool obscureText;
  const MyTextField2({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(bottom: 8,top: 2, left: 10, right: 10), height: 62 ,
      child: TextField(
        
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions),),
          suffixIcon: IconButton(onPressed: () {
            Navigator.push(
                context, 
                 MaterialPageRoute(builder: (context)=>  MainScreen()
                  ));
          }, icon: Icon(Icons.camera_alt),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color(0xFFEAEAEA), width: 2),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color:Color(0XFF848484), width: 2),
          ),
          fillColor: Color(0xFFFAFAFA),
          filled: true,
          hintText: hinText,
          hintStyle: const TextStyle(color: Colors.grey),
          
        )
      ),
    );
  }
}