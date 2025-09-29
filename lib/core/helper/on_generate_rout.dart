import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/view/login_view.dart';
import 'package:fruit/features/auth/presentation/view/signup_view.dart';
import 'package:fruit/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit/features/splash/presentation/view/splash_view.dart';


class OnGenerateRout {
  static const String splashRoutName = 'splash';
  static const String onBoardingView = 'onBoardingView';
  static const String loginView = 'loginView';
  static const String signUpView = 'signUpView';
static  Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case OnGenerateRout.splashRoutName:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case OnGenerateRout.onBoardingView:
        return MaterialPageRoute(
          builder: (context) => OnBoardingView(),
        );
      case OnGenerateRout.loginView:
        return MaterialPageRoute(
          builder: (context) => LogInView(),
        );
      case OnGenerateRout.signUpView:
        return MaterialPageRoute(
          builder: (context) => SignUpView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
