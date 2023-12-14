import 'package:flutter/material.dart';

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
      padding:EdgeInsets.only(bottom: 2,top: 2, left: 3, right: 2), height: 55 ,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
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