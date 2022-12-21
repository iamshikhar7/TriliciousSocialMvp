import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../../data/services/local/storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/user_repository.dart';
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
        backgroundColor: AppTheme.lightpink,
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
          return const Center(
              child: CircularProgressIndicator(
            color: AppTheme.pink,
          ));
        }
        if (state is Unauthenticated) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/login.svg',
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 48.w, top: 68.h, bottom: 46.h),
                  child: Text(
                    'Login',
                    style: AppTheme.h1.copyWith(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: SizedBox(
                    width: 282.w,
                    height: 40.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 42.w),
                      child: MaterialButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(const SignInEvent());
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login with Google',
                              style: AppTheme.h2.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppTheme.black,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            SvgPicture.asset('assets/icons/google_icon.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
                Center(
                    child: SvgPicture.asset('assets/images/login_cover.svg')),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
