import 'package:flutter/material.dart';
import 'package:flutter_application_message/component/my_button.dart';
import 'package:flutter_application_message/component/my_text_field.dart';
import 'package:flutter_application_message/services/auth/auth_service.dart';
import 'package:flutter_application_message/testingPage/testingpage.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final passwordControler = TextEditingController();
  final namaPenggunaControler = TextEditingController();
  final confirmPasswordControler = TextEditingController();

  //SignUp User
  void signUp() async {
    if (passwordControler.text != confirmPasswordControler.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password do not Match!'),
        ),
      );
    }
    else if (passwordControler.text != confirmPasswordControler.text) {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context)=> const LayarLogika12(data: 'Rumus Kubus')));
      
    }

    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
        emailcontroller.text,
        passwordControler.text,
        namaPenggunaControler.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
          leading: Icon(Icons.arrow_back_ios), actions: [],
          elevation: 0,
          title: Text('Register Page',
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          backgroundColor: Color(0xFFEB6E4E)),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 12),
                  SizedBox(
                    child: Text(
                      'Selamat Datang ! Silahkan masukkan nama, email, password data diri anda untuk membuat akun',
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 30),
      
                  //  const Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     SizedBox(
                  //       child: Text(
                  //         'Nama :',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 8),
                  // //email texfield
                  // MyTextField(
                  //     controller: emailcontroller,
                  //     hinText: 'Nama',
                  //     obscureText: false),
                  // const SizedBox(height: 20),
      
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Nama Pengguna :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  //email texfield
                  MyTextField(
                    suffixIcon: null,
                    prefixIcon: Icon(Icons.person),
                      controller: namaPenggunaControler,
                      hinText: 'Nama Pengguna',
                      obscureText: false),
                  const SizedBox(height: 20),
      
                  //logo
                  // Icon(
                  //   Icons.message,
                  //   size: 100,
                  //   color: Colors.grey[800],
                  // ),
      
                  // //crae account message
                  // const Text(
                  //   'Lets Create an account for you',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // const SizedBox(height: 25),
      
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Email :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  //email texfield
                  MyTextField(
                    suffixIcon: null,
                    prefixIcon: Icon(Icons.email),
                      controller: emailcontroller,
                      hinText: 'Email',
                      obscureText: false),
                  const SizedBox(height: 20),
      
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Password :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
      
                  //Password TextField
                  MyTextField(
                    suffixIcon: Icon(Icons.remove_red_eye),
                    prefixIcon: null,
                      controller: passwordControler,
                      hinText: '  Password',
                      obscureText: true),
                  const SizedBox(height: 20),
      
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Confirm Password :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  //confirm password
                  MyTextField(
                    suffixIcon: Icon(Icons.remove_red_eye),
                    prefixIcon: null,
                      controller: confirmPasswordControler,
                      hinText: '  Confirm Password',
                      obscureText: true),
                  const SizedBox(height: 25),
      
                  SizedBox(
                    child: Container(
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFEAEAEA),
                      ))),
                    ),
                  ),
      
                  const SizedBox(height: 25),
      
                  //sign up button
                  MyButton(onTap: signUp, text: 'Sign Up'),
                  const SizedBox(height: 30),
      
                  //not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sudah Punya Akun ?', style: TextStyle(fontSize: 15),),
                      const SizedBox(width: 8),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login Sekarang',
                            style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// DecoratedBox(
//         decoration:  BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/backgroud.jpg'),),
//           shape: BoxShape.circle
//         ),