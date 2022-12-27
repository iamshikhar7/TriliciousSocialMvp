import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trilicious_mvp/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trilicious_mvp/domain/repositories/auth_repository.dart';
import 'package:trilicious_mvp/screens/login/login_screen.dart';
import 'package:trilicious_mvp/services/local/storage.dart';

import 'AppRouter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalStorageService.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

//
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => AuthRepository(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (__, chinldN_) {
          return GetMaterialApp(
            title: 'Gifty',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: LocalStorageService.instance.isLoggedIn
                ? HomePage.id
                : LoginScreen.id,
          );
        },
        designSize: const Size(360, 640),
      ),
    );
  }
}
