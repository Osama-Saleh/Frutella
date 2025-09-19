import 'package:flutter/material.dart';
import 'package:fruit/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit/features/splash/presentation/view/splash_view.dart';


class OnGenerateRout {
  static const String splashRoutName = 'splash';
  static const String onBoardingView = 'onBoardingView';
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
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
