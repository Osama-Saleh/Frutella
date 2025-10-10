import 'package:flutter/material.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';

class SignupState {
  final bool isLoading;
  final bool isLoaded;
  final UserEntity? user;
  final String? error;
  final AutovalidateMode? autovalidateMode;

  const SignupState({
    this.isLoading = false,
    this.isLoaded = false,
    this.user,
    this.error,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  SignupState copyWith({
    bool? isLoading,
    bool? isLoaded,
    UserEntity? user,
    String? error,
    AutovalidateMode? autovalidateMode,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      user: user ?? this.user,
      error: error ?? this.error,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}
