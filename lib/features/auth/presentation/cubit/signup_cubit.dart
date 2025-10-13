import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';
import 'package:fruit/features/auth/presentation/cubit/signup_state.dart';


class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupState());

   void changeAutovalidateMode(AutovalidateMode mode) {
    emit(state.copyWith(autovalidateMode: mode));
  }
  void changePasswordVisibility(){
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String? name,
  }) async {
    emit(state.copyWith(isLoading: true,isLoaded: false,error: ''));
    final result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password, name: name);
    result.fold(
      ifRight: (value) => emit(state.copyWith(isLoading: false, isLoaded: true, user: value, error: '')),
      ifLeft: (l) => emit(state.copyWith(isLoading: false, isLoaded: false, error: l.message)),
    );
  }
}
