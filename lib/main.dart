import 'package:flutter/material.dart';
import 'package:trilicious_mvp/HomePage.dart';
import 'package:trilicious_mvp/ProfileUtils.dart';
import 'package:trilicious_mvp/screens/LoginPages/LoginPage.dart';
import 'package:trilicious_mvp/screens/LoginPages/ProviderLoginPage.dart';
import 'package:trilicious_mvp/screens/LoginPages/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trilicious_mvp/services/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trilicious_mvp/services/FirebaseOperations.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => ProfileUtils()),
          ChangeNotifierProvider(create: (_) => FirebaseOperations()),
          ChangeNotifierProvider(create: (_) => Authentication()),
          ChangeNotifierProvider(create: (_) => ProviderLoginPage())
        ]);
  }
}
