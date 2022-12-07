import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trilicious_mvp/services/FirebaseOperations.dart';

class ProfileUtils with ChangeNotifier {
  final picker = ImagePicker();
  late File userAvatar;
  File get getUserAvatar => userAvatar;
  String? userAvatarUrl;
  String? get getUserAvatarUrl => userAvatarUrl;

  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickedUserAvatar = await picker.pickImage(source: source);
    pickedUserAvatar == null
        ? print('Select Image')
        : userAvatar = File(
            pickedUserAvatar.path,
          ) ;
    print(userAvatar?.path);

    userAvatar != null
        ? Provider.of<FirebaseOperations>(context, listen: false).uploadUserAvatar(context)
        : print('image upload error');
    notifyListeners();
  }
}
