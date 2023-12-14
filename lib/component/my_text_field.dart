import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final bool obscureText;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obscureText,
    required this.prefixIcon,
    required this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0), height: 55,
      child: TextField(
        
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFEAEAEA), width: 2),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color:Color(0xFFEB6E4E), width: 2),
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