import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilicious_mvp/ProfilePage.dart';
import 'widgets/FilterBox.dart';
import 'MainHomePage.dart';
import 'MapPage.dart';
import 'QR_Scanner.dart';
import 'ReelPage.dart';
import 'constants/app_text.dart';
import 'package:flutter/material.dart';
import 'constants/app_large_text.dart';
import 'widgets/AdBanner.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    if(mounted)
    {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: currentIndex == 0
            ? const MainHomePage()
            : currentIndex == 1
                ? const SnackMap()
                : currentIndex == 2
                    ? HomeScreen()
                    : const ProfilePage(),
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }



  bottomNavBar() {
    double displayWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          margin: EdgeInsets.all(displayWidth * .05),
          height: displayWidth * .1,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .0009),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .30
                        : displayWidth * .20,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? displayWidth * .12 : 0,
                      width: index == currentIndex ? displayWidth * .35 : 0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xffFDBD19),
                          Color(0xffFF9707),
                        ]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? '${listOfStrings[index]}'
                                    : '',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .04
                                  : 20,
                            ),
                            InkWell(
                             // onTap: setBottomBarIndex(index),
                              child: IconButton(
                                icon : Icon(
                                  listOfIcons[index],
                                  size: displayWidth * .04,
                                  color: index == currentIndex
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.7),
                                ), onPressed: () { setState(() {
                                  currentIndex = index ;
                                }); },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.location_on_rounded,
    Icons.play_circle,
    Icons.person,
  ];

  List<String> listOfStrings = [
    'Home',
    'Map',
    'Clips',
    'Profile',
  ];
}
