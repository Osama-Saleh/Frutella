import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/view/singin_view.dart';
import 'package:fruit/features/auth/presentation/view/signup_view.dart';
import 'package:fruit/features/best_saler/presentation/view/best_saler.dart';
import 'package:fruit/features/home/presentation/views/home_view.dart';
import 'package:fruit/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit/features/splash/presentation/view/splash_view.dart';


class OnGenerateRout {
  static const String splashRoutName = 'splash';
  static const String onBoardingView = 'onBoardingView';
  static const String signIn = 'signIn';
  static const String signUpView = 'signUpView';
  static const String homeView = 'homeView';
  static const String bestSaler = 'bestSaler';
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
      case OnGenerateRout.signIn:
        return MaterialPageRoute(
          builder: (context) => SingInView(),
        );
      case OnGenerateRout.signUpView:
        return MaterialPageRoute(
          builder: (context) => SignUpView(),
        );
      case OnGenerateRout.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
        );
      case OnGenerateRout.bestSaler:
        return MaterialPageRoute(
          builder: (context) => BestSaler(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
