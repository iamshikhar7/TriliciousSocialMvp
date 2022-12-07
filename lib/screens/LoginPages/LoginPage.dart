import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/HomePage.dart';
import 'package:trilicious_mvp/screens/LoginPages/RegisterPage.dart';
import 'package:trilicious_mvp/services/Authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Controller
 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();

 Future signIn() async{
   await FirebaseAuth.instance.signInWithEmailAndPassword(
     email: _emailController.text.trim(),
     password: _passwordController.text.trim(),
   );
 }

 @override
 void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
   super.dispose();
 }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container
            (height: double.maxFinite,
              child: Image.asset('assets/images/Frame1.png', fit: BoxFit.cover,),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Center(
              child: Container(
                height: 550,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40,20,40,20),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      Image.asset('assets/images/Orangefont.png', height: 30,),
                       const SizedBox(height:30,),
                       TextField(
                         controller: _emailController,
                         cursorColor: Colors.orange,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.grey.shade300),
                             borderRadius: BorderRadius.circular(12),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: const BorderSide(color: Colors.orange),
                             borderRadius: BorderRadius.circular(12),
                           ),
                            hintText: 'Email',
                         ),
                       ),
                      const SizedBox(height: 20,),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          if(_emailController.text.isNotEmpty) {Provider.of<Authentication>(context, listen: false).logIntoAccount(_emailController.text, _passwordController.text).whenComplete((){
                            Navigator.pushReplacement(context, PageTransition(child: HomePage(), type: PageTransitionType.leftToRight));});
                          }
                          else{
                            Navigator.pushReplacement(context, PageTransition(child: LoginPage(), type: PageTransitionType.fade));
                          }
                        },
                        child: Container(
                          height: 60,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: Text('Log in',style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                )
                            ),),
                          ),
                        ),
                      ),
                     const Padding(
                       padding: EdgeInsets.all(20.0),
                       child: Divider(
                         color: Colors.grey,
                       ),
                     ),
                      MaterialButton(
                        onPressed: () {
                          Provider.of<Authentication>(context, listen: false).signInWithGoogle().whenComplete((){
                            Navigator.pushReplacement(context, PageTransition(child: const HomePage(), type: PageTransitionType.leftToRight));
                          });

                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(width: 2, color: Colors.orange)
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                const Spacer(flex: 2,),
                                Image.asset('assets/images/google.png', height: 40,),
                                const Spacer(flex: 1,),
                                Text('Sign in with Google',style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 15
                                  )
                                ),
                                ),
                                const Spacer(flex: 2,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextButton(
                        onPressed: (){
                          //Redirect to Register Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage(),
                              ),
                            );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Not a member? ',
                            style: GoogleFonts.montserrat(textStyle: const TextStyle(
                              color: Colors.black,
                            )),
                            children: const <TextSpan>[
                              TextSpan(text: ' Sign Up here', style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
