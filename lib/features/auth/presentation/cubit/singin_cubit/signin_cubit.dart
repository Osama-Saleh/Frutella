import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(SigninState());

    void changeAutovalidateMode(AutovalidateMode mode) {
      emit(state.copyWith(autovalidateMode: mode));
    }
    void changePasswordVisibility(){
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true,isLoaded: false,error: ''));
    final result = await authRepo.loginWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      ifRight: (value) => emit(state.copyWith(isLoading: false, isLoaded: true, user: value, error: '')),
      ifLeft: (l) => emit(state.copyWith(isLoading: false, isLoaded: false, error: l.message)),
    );
  }

  
}
