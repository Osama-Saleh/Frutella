part of 'signin_cubit.dart';

class SigninState {
  final bool isPasswordVisible;
  final bool isLoading;
  final bool isLoaded;
  final String error;
  final UserEntity? user;
  final AutovalidateMode autovalidateMode;

  SigninState({
    this.isPasswordVisible = false,
    this.isLoading = false,
    this.isLoaded = false,
    this.error = '',
    this.user,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  SigninState copyWith({
    bool? isPasswordVisible,
    bool? isLoading,
    bool? isLoaded,
    String? error,
    UserEntity? user,
    AutovalidateMode? autovalidateMode,
  }) {
    return SigninState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      error: error ?? this.error,
      user: user ?? this.user,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}




