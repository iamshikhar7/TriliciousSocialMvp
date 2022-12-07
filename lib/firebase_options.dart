// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALSpmyVJqgEBwt9fFfgDk9zU4tJYDylWk',
    appId: '1:871527419958:web:18f71186cee7e52ed74897',
    messagingSenderId: '871527419958',
    projectId: 'trilicioussocial',
    authDomain: 'trilicioussocial.firebaseapp.com',
    storageBucket: 'trilicioussocial.appspot.com',
    measurementId: 'G-6YWP25JLNG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAizNqt3CDlk3cpfdVeZcc7LOrzJxzgHyQ',
    appId: '1:871527419958:android:8e8cc801f569b56fd74897',
    messagingSenderId: '871527419958',
    projectId: 'trilicioussocial',
    storageBucket: 'trilicioussocial.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0xOuco8sxZdjMIg5TLkEpB0vIjCSnffw',
    appId: '1:871527419958:ios:3ac9ead89a0d11f4d74897',
    messagingSenderId: '871527419958',
    projectId: 'trilicioussocial',
    storageBucket: 'trilicioussocial.appspot.com',
    androidClientId: '871527419958-g7spbqelphdog1i6l7atqnhja0a31bh7.apps.googleusercontent.com',
    iosClientId: '871527419958-lp3cqolb7mvk5q6330s3vv2ulgqbj7r7.apps.googleusercontent.com',
    iosBundleId: 'com.example.triliciousMvp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0xOuco8sxZdjMIg5TLkEpB0vIjCSnffw',
    appId: '1:871527419958:ios:3ac9ead89a0d11f4d74897',
    messagingSenderId: '871527419958',
    projectId: 'trilicioussocial',
    storageBucket: 'trilicioussocial.appspot.com',
    androidClientId: '871527419958-g7spbqelphdog1i6l7atqnhja0a31bh7.apps.googleusercontent.com',
    iosClientId: '871527419958-lp3cqolb7mvk5q6330s3vv2ulgqbj7r7.apps.googleusercontent.com',
    iosBundleId: 'com.example.triliciousMvp',
  );
}
