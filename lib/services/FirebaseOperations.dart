import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/services/Authentication.dart';

import '../ProfileUtils.dart';

class FirebaseOperations with ChangeNotifier {
  late UploadTask imageUploadTask;
  String? initUserEmail;
  String? initUserName;
  String? initUserImage;

  Future uploadUserAvatar(BuildContext context) async {
    Reference imageReference = FirebaseStorage.instance.ref().child(
        'userProfileAvatar/${Provider.of<ProfileUtils>(context, listen: false).getUserAvatar.path}/${TimeOfDay.now()}');
    imageUploadTask = imageReference.putFile(
        Provider.of<ProfileUtils>(context, listen: false).getUserAvatar);

    await imageUploadTask.whenComplete(() {
      print('Image uploaded');
    });
    imageReference.getDownloadURL().then((url) {
      Provider.of<ProfileUtils>(context, listen: false)
          .getUserAvatarUrl
          .toString();
      print(
          'the user profile avatar url => ${Provider.of<ProfileUtils>(context, listen: false).getUserAvatarUrl}');
      notifyListeners();
    });
  }

  Future createUserCollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .set(data);
  }
}

Future initUserData(BuildContext context) async {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
      .get()
      .then((doc) {
    String initUserName = doc.data()!['username'];
    String initUserEmail = doc.data()!['useremail'];
    String initUserImage = doc.data()!['userimage'];

    notifyListeners();

  });
}

void notifyListeners() {
}
