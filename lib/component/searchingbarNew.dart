import 'package:flutter/material.dart';

class SearchBar2 extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final bool obscureText;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  const SearchBar2({
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
      
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: TextField(
        
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xFFF19F6D), width: 2),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color:Color(0xFFEB6E4E), width: 2),
          ),
          fillColor: Colors.white,
          
          filled: true,
          hintText: hinText,
          hintStyle: const TextStyle(color: Colors.grey),
          
          
          
        )
      ),
    );
  }
}