import 'package:flutter/material.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';

class SignupState {
  final bool isLoading;
  final bool isLoaded;
  final UserEntity? user;
  final String? error;
  final AutovalidateMode? autovalidateMode;
  final bool isPasswordVisible;

  const SignupState({
    this.isLoading = false,
    this.isLoaded = false,
    this.user,
    this.error,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.isPasswordVisible = false,
  });

  SignupState copyWith({
    bool? isLoading,
    bool? isLoaded,
    UserEntity? user,
    String? error,
    AutovalidateMode? autovalidateMode,
    bool? isPasswordVisible,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      user: user ?? this.user,
      error: error ?? this.error,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
  // create it to help in debugging at Bloc Obsever
  //   @override
  // String toString() {
  //   return 'SignupState(isLoading: $isLoading, isLoaded: $isLoaded, user: $user, error: $error, autovalidateMode: $autovalidateMode)';
  // }
}
