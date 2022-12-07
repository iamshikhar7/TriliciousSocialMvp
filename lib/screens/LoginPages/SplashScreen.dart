import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trilicious_mvp/screens/LoginPages/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void initState() {
    Timer(
      Duration(
        seconds: 3
      ),
        () => Navigator.pushReplacement(context, PageTransition(child: LoginPage(), type: PageTransitionType.leftToRight),
        ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.maxFinite,
              child: Image.asset('assets/images/Frame1.png', fit: BoxFit.cover,),
          ),
          Center(
            child: Container(
              height: 190,
              width: double.maxFinite,
             decoration: BoxDecoration(
               color: Colors.white,
             ),
              child: Column(
                children: [
                  SizedBox(height: 66,),
                  Image.asset('assets/images/Orangefont.png', height: 50,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
