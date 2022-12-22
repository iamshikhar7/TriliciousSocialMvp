import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../HomePage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../services/Authentication.dart';
import '../../services/local/storage.dart';
import '../login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<AuthRepository>(),
        userRepository: context.read<UserRepository>(),
      ),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          LocalStorageService.instance.isLoggedIn = true;
          state.path == 'feed'
              ? LocalStorageService.instance.isUserDetails = true
              : LocalStorageService.instance.isUserDetails = false;
          Get.offAllNamed(state.path);
        }
        if (state is SignInError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is Unauthenticated) {
          Stack(children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image.asset(
                'assets/images/Frame1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Center(
              child: Container(
                height: 240,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/images/Orangefont.png',
                        height: 30,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(const SignInEvent());
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 2, color: Colors.orange)),
                          child: Center(
                            child: Row(
                              children: [
                                const Spacer(
                                  flex: 2,
                                ),
                                Image.asset(
                                  'assets/images/google.png',
                                  height: 40,
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Sign in with Google',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(fontSize: 15)),
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        }
        return Container();
      },
    );
  }
}
