import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_message/component/my_button.dart';
import 'package:flutter_application_message/component/my_text_field.dart';

class LupaPasswordScreen extends StatefulWidget {
  const LupaPasswordScreen({Key? key}) : super(key: key);

  @override
  _LupaPasswordScreenState createState() => _LupaPasswordScreenState();
}

class _LupaPasswordScreenState extends State<LupaPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  // Fungsi untuk menampilkan pop-up window
  Future<void> _showMessageDialog(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk mereset password
  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );

      _showMessageDialog(
          'Email reset kata sandi telah dikirim. Silakan periksa kotak masuk Anda.');
    } catch (e) {
      String errorMessage = 'Gagal mereset kata sandi. Silakan coba lagi.';
      _showMessageDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F5DC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5DC),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('assets/forgotpassword2.png'),
            height: 300,
          ),
          SizedBox(height: 60),
          Padding(
            padding:  const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                Text('Forgot Password?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding:  const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                Text('Don’t worry ! It happens. Please enter the phone \nnumber we will send the OTP in this phone number.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(
                    controller: _emailController,
                    hinText: 'Masukkan Email Anda',
                    obscureText: false,
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: null),
                SizedBox(height: 20),
                MyButton(onTap: _resetPassword, text: 'Reset Password')
                // ElevatedButton(
                //   onPressed: _resetPassword,
                //   child: Text('Reset Password'),
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.blue,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
