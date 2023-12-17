import 'package:flutter/material.dart';
import 'package:flutter_application_message/testingPage/profile.dart';

class MyButton2 extends StatelessWidget {
  final String text;
  final dynamic image;
  const MyButton2({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: ()=>{
                Navigator.push(
                context, 
                 MaterialPageRoute(builder: (context)=>  Profile1()
                  )),
              },

      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration (
          color: Color(0xFFFAFAFA),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.6, color: Color(0xFFF19F6D)),
            borderRadius: BorderRadius.circular(48)
          ),
          shadows: [
            const BoxShadow(
              color: Color(0xFFF19F6D),
              blurRadius: 1,
              offset: Offset(0, 1),
              spreadRadius: 1,
            ),
          ]
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: image, height:30, width: 30),
              Text(text,
              style: const TextStyle(
                color: Color(0xFFEB6E4E),
                fontWeight: FontWeight.bold ,
                fontSize: 16
              ),),
            ],
          ),

        ),
      ),

    );
  }
}