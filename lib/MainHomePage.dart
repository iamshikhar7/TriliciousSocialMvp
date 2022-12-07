import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/QR_Scanner.dart';
import 'package:trilicious_mvp/constants/HeadText.dart';
import 'package:trilicious_mvp/screens/LoginPages/LoginPage.dart';
import 'package:trilicious_mvp/services/Authentication.dart';
import 'HomePage.dart';
import 'widgets/AdBanner.dart';
import 'widgets/FilterBox.dart';
import 'widgets/ImageCard.dart';
import 'NewPost.dart';
import 'ProfilePage.dart';
import 'widgets/rosted.dart';
import 'constants/app_large_text.dart';
import 'constants/app_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 10,
                sigmaX: 10,
              ),
              child: SizedBox(
                width: 300,
                child: Drawer(
                  elevation: 10,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                       const SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/Orangefont.png',
                              height: 30,
                            ),
                            const SizedBox(
                              width: 75,
                            ),
                            Container(
                              height: 60,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState
                                      ?.closeDrawer();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          onPressed: (){
                           Navigator.pushReplacement(context, PageTransition(child: ProfilePage(), type: PageTransitionType.leftToRight));
                          },
                          child: Container(
                            height: 130,
                            width: 230,
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: [
                                AppLargeText(
                                  text: 'Profile',
                                  size: 12,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0xffEEABFF),
                                      radius: 45.0,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                          'assets/images/shelly.png',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      children: [
                                        AppLargeText(
                                          text: 'Shelly007',
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        AppText(
                                          text: '5400 Followers',
                                          size: 13,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppLargeText(
                          text: 'Menu',
                          size: 12,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15),
                                child: AppText(
                                  text: 'New Delhi',
                                  size: 15,
                                  color: Colors.orange,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.orange,
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            AppText(text: 'Veg only'),
                            const SizedBox(
                              width: 150,
                            ),
                            Icon(
                              Icons.toggle_off_outlined,
                              color: Colors.grey.shade700,
                              size: 30,
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.grey.shade700,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AppText(text: 'Settings'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            IconButton(
                              onPressed: (){
                                Navigator.pushReplacement(context, PageTransition(child: QRScanner(), type: PageTransitionType.topToBottom));
                              },
                              icon: Icon(
                                Icons.qr_code_sharp,
                                color: Colors.grey.shade700,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AppText(text: 'Scan QR'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.email,
                              color: Colors.grey.shade700,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AppText(text: 'Contact us'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: (){
                            Provider.of<Authentication>(context, listen: false).logOutViaEmail().whenComplete(()
                            => Navigator.pushReplacement(context,
                                PageTransition(child: LoginPage(), type: PageTransitionType.leftToRight)));
                          },
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Icon(
                                Icons.logout,
                                color: Colors.grey.shade700,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              AppText(text: 'Logout'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 100,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, PageTransition(child: NewPost(), type: PageTransitionType.bottomToTop ),
                                    );
                                  },
                                  child: Container(
                                    height: 90,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          blurRadius: 8.0,
                                        ),
                                      ],
                                      borderRadius:
                                      BorderRadius.circular(24),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xffFDBD19),
                                        Color(0xffFF9707)
                                      ]),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        AppLargeText(
                                          text: 'New Post',
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.add_circle_rounded,
                                          size: 35,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.orange,
            size: 30,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/Orangefont.png',
              height: 25,
            ),
          ],
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(),
          ),
        ),
      ),
      body: Stack(children: [
        ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.explore,
                        size: 35,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                     Text('Explore',style: GoogleFonts.montserrat(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                       letterSpacing: -2,
                       color: Colors.grey.shade800,
                     ),)
                    ],
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.orange,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          AppText(
                            text: 'New Delhi',
                            size: 15,
                            color: Colors.orange,
                          ),
                          const Spacer(flex: 1,),
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context)
                              {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    height: 600,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 250,
                                            height: 100,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(30),
                                             color: Colors.white,
                                             border: Border.all(color: Colors.orange)
                                           ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 250,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.white,
                                                border: Border.all(color: Colors.orange)
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 250,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.white,
                                                border: Border.all(color: Colors.orange)
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 250,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.white,
                                                border: Border.all(color: Colors.orange)
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        AppText(text: 'More cities coming soon!')
                                      ],
                                    ),
                                  ),
                                );
                              }
                              );
                            },
                              child: const Icon(Icons.arrow_drop_down_circle, color: Colors.orange,)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 320,
              color: Colors.white,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: const [
                  ReelCard(outletName: 'BBQ house', dishName: 'Roasted Delights'),
                ReelCard(outletName: 'BBQ house', dishName: 'Roasted Delights'),
                ReelCard(outletName: 'BBQ house', dishName: 'Roasted Delights'),
                ReelCard(outletName: 'BBQ house', dishName: 'Roasted Delights'),
                ReelCard(outletName: 'BBQ house', dishName: 'Roasted Delights'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadText(
                    text: 'What are you craving?',
                    size: 18,
                    color: Colors.black54,
                  ),
                  AppText(
                    text: "See all",
                    color: Colors.grey.shade700,
                    size: 14,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const FilterContent(),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                HeadText(
                  text: 'Featured Dishes',
                  size: 1,
                  color: Colors.grey.shade700,
                ),
              ],
            ),
            const SizedBox(
              height: 0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        AdBanner(),
                        ImageCard(),
                        ImageCard(),
                      ],
                    ),
                    Column(
                      children: const [
                        ImageCard(),
                        ImageCard(),
                        AdBanner(),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                elevation: 4,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset('assets/images/MapFrame.png',
                            height: 250, width: 390, fit: BoxFit.fitWidth),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
           HeadText(text: 'Feeds',
           color: Colors.grey.shade800,
           size: 25,),
          ],
        ),
      ]),
      extendBody: true,
    );
  }
}
