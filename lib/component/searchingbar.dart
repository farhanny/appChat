import 'package:flutter/material.dart';

class MySeachBar extends StatelessWidget {
  final SearchController controller;
  final String hinText;
  final bool obscureText;
  const MySeachBar({
    super.key,
    required this.controller,
    required this.hinText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      // decoration: ShapeDecoration(shape: OutlineInputBorder() ),
      
      child: SearchBar(
        
        controller: controller,
        leading: Icon(Icons.search_rounded, color: Colors.black54,),
        hintText: hinText,
      ),
    );
  }
}