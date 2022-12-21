import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/HomePage.dart';
import 'package:trilicious_mvp/screens/LoginPages/RegisterPage.dart';
import 'package:trilicious_mvp/services/Authentication.dart';

import '../../services/local/storage.dart';
import '../../widgets/TextFieldInput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final localStorageService = LocalStorageService();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/Frame1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: Container(
              height: 240,
              width: 340,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/Orangefont.png',
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Provider.of<Authentication>(context, listen: false)
                            .signInWithGoogle()
                            .whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const HomePage(),
                                  type: PageTransitionType.leftToRight));
                        });
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(width: 2, color: Colors.orange)),
                        child: Center(
                          child: Row(
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Image.asset(
                                'assets/images/google.png',
                                height: 40,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                'Sign in with Google',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
