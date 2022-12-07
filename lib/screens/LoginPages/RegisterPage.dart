import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/HomePage.dart';
import 'package:trilicious_mvp/ProfileUtils.dart';
import 'package:trilicious_mvp/screens/LoginPages/LoginPage.dart';
import 'package:trilicious_mvp/services/AuthMethods.dart';
import 'package:trilicious_mvp/services/FirebaseOperations.dart';
import 'package:trilicious_mvp/widgets/TextFieldInput.dart';

import '../../services/Authentication.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final userNameController = TextEditingController();


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
            children: [Container
              (height: double.maxFinite,
                child: Image.asset('assets/images/Frame1.png', fit: BoxFit.cover,)),
              Container(
                color: Colors.black.withOpacity(0.4),
              ),
              Center(
                child: Container(
                  height: 650,
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
                       TextFieldInput(textEditingController: userNameController,
                         hintText: 'Set your username',
                         textInputType: TextInputType.text,
                         isPass: false
                       ),
                        const SizedBox(height: 20,),
                        TextFieldInput(textEditingController: _emailController,
                            hintText: 'Email',
                            textInputType: TextInputType.text,
                            isPass: false
                        ),
                        const SizedBox(height: 20,),
                        TextFieldInput(textEditingController: _passwordController,
                            hintText: 'Set a Password',
                            textInputType: TextInputType.text,
                            isPass: true
                        ),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () async{
                            AuthMethods().signUpUser(email: _emailController.text, password: _passwordController.text, username: userNameController.text);
                          },
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange,
                            ),
                            child: Center(
                              child: Text('Sign-up',style: GoogleFonts.montserrat(
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
                                  Text('Sign-up with Google',style: GoogleFonts.montserrat(
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
                            // Within the `FirstRoute` widget
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage(),
                                ),
                              );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already a member? ',
                              style: GoogleFonts.montserrat(textStyle:
                              const TextStyle(
                                color: Colors.black,
                              ),
                              ),
                              children: const <TextSpan>[
                                TextSpan(text: ' Login here', style: TextStyle(fontWeight: FontWeight.bold,
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

