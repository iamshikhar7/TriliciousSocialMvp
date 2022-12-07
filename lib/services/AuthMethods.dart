import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // S I G N - U P
  Future<String> signUpUser({
    String? bio,
    required String email,
    required String password,
    required String username,
}) async {
    String res = "some error occured";
    try{
      if(email.isNotEmpty ||password.isNotEmpty ||username.isNotEmpty) {
        // R E G I S T E R   U S E R
        UserCredential cred  = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        
        // ADD USER TO DATABASE
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio' : bio,
          'followers': [],
          'following': [],
        });

        //
        //await _firestore.collection('users').add({
          //'username': username,
          //'uid': cred.user!.uid,
         // 'email': email,
          //'bio' : bio,
          //'followers': [],
          //'following': [],
       // });


        res = "success";
      }
    } catch(err) {
      res = err.toString();
    }
    return res;
  }
}