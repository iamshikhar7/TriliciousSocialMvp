import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/ProfileUtils.dart';
import 'widgets/CategoryCard.dart';
import 'widgets/rosted.dart';
import 'constants/app_large_text.dart';
import 'constants/app_text.dart';
import 'package:trilicious_mvp/ProfileUtils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(1),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'My Profile',
                size: 20,
              ),
              Image.asset(
                'assets/images/Orangefont.png',
                height: 30,
              ),
            ],
          )),
      body: Stack(children: [
        Image.asset(
          'assets/images/FoodBg.png',
          height: 300,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6,
                            )
                          ]),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            AppLargeText(
                              text: 'Shelly007',
                              size: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 260,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade100,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    AppText(
                                      text: 'A bowl of noodle can make my day!',
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.edit,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 150,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffFDBD19),
                                  Color(0xffFF9707)
                                ]),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              height: 20,
                              child: Center(
                                child: AppLargeText(
                                  text: 'Food Style',
                                  size: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            //
                            //todo Configure the category card and integrate here
                            //
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(color: Colors.orange, width: 2),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  CategoryCard(
                                    categoryImage: 'assets/images/dimsum.png',
                                    categoryName: 'dimsum',
                                  ),
                                  CategoryCard(
                                    categoryImage: 'assets/images/dimsum.png',
                                    categoryName: 'dimsum',
                                  ),
                                  CategoryCard(
                                    categoryImage: 'assets/images/dimsum.png',
                                    categoryName: 'dimsum',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 35,
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.orange, width: 2),
                                      ),
                                      child: Center(
                                        child: AppText(
                                          text: 'Followers',
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Followers
                                  Expanded(
                                    child: Container(
                                      height: 35,
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.orange, width: 2)),
                                      child: Center(
                                          child: AppText(
                                        text: 'Following',
                                      )),
                                    ),
                                  ),
                                  //Following
                                ],
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: 6,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / 1.7),
                              itemBuilder: (BuildContext context, int index) {
                                return const ReelCard(
                                    outletName: 'BBQ house',
                                    dishName: 'Roasted Delights');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(color: Colors.black54, blurRadius: 7)
                            ]),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      children: [
                                        Spacer(
                                          flex: 1,
                                        ),
                                        AppText(text: 'Select a Picture'),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                Provider.of<ProfileUtils>(context, listen: false).pickUserAvatar(context,ImageSource.gallery).whenComplete(()
                                                {
                                                  Navigator.pop(context);
                                                }
                                                );
                                              },
                                              child: Card(
                                                color: Colors.orange,
                                                child: Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .photo_size_select_actual_rounded,
                                                        color: Colors.white,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      AppText(
                                                        text: 'Gallery',
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                Provider.of<ProfileUtils>(context, listen: false).pickUserAvatar(context,ImageSource.camera).whenComplete(()
                                                {
                                                  Navigator.pop(context);
                                                }
                                                );

                                              },
                                              child: Card(
                                                color: Colors.orange,
                                                child: Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.camera_alt,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      AppText(
                                                        text: 'Camera',
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(
                                          flex: 2,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffEEABFF),
                            radius: 60,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage(
                                'assets/images/shelly.png',
                                  //FileImage(
                                    //Provider.of<ProfileUtils>(context, listen: false).userAvatar
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              // Display Picture
            ],
          ),
        ),
      ]),
    );
  }
}
