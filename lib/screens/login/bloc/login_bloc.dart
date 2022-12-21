import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authRepository, required this.userRepository})
      : super(const Unauthenticated()) {
    on<SignInEvent>((event, emit) async {
      emit(const SignInLoading());
      try {
        final result = await authRepository.signInwithGoogle();
        final path = await userRepository.getPath();
        emit(SignInSuccess(result.toString(), path));
      } catch (e) {
        print(e);
        if (e is FirebaseAuthException) {
          emit(SignInError(e.message!));
          print(e.message);
          emit(const Unauthenticated());
        }
      }
    });
  }
  final AuthRepository authRepository;
  final UserRepository userRepository;
}
