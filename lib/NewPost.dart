import 'package:flutter/material.dart';
import 'package:trilicious_mvp/widgets/ImageCard.dart';
import 'package:trilicious_mvp/constants/app_large_text.dart';
import 'widgets/ImageCard.dart';
import 'constants/app_large_text.dart';
import 'constants/app_text.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              height: 25,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: Column(
               
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: 'Dish',
                              size: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Colors.orange),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child: AppText(
                                    text: 'Roasted Delights',
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: 'Location',
                              size: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Colors.orange),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppText(
                                        text: 'Greater Kailash,',
                                        size: 15,
                                        color: Colors.grey,
                                      ),
                                      AppText(
                                        text: 'New Delhi',
                                        size: 15,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children:  const [
                        ImageCard(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    AppLargeText(
                      text: 'Chose a Category',
                      size: 16,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: AppText(
                            text: 'Fast Food',
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    AppLargeText(
                      text: 'Delivery link (Optional) ',
                      size: 16,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: AppText(
                            text: 'sdcjhjv.zomato.in',
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: double.maxFinite,
              height: 65,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffFDBD19), Color(0xffFF9707)]),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppText(
                    text: 'Upload',
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

