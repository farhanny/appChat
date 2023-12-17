import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: ShapeDecoration (
          color: Color(0xFFEB6E4E),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFEAEAEA),),
            borderRadius: BorderRadius.circular(48)
          ),
          shadows: [
             BoxShadow(
              color: Color(0x4FFF3D00).withOpacity(0.4),
              blurRadius: 14,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ]
        ),
        child: Center(
          child: Text(text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold ,
            fontSize: 16
          ),),

        ),
      ),

    );
  }
}