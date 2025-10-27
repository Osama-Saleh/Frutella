import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/app_constant/app_constant.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
import 'package:fruit/core/services/firebase_auth_services.dart';
import 'package:fruit/core/services/shared_prefrences.dart';
import 'package:fruit/core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _initializeApp() async {
    bool isViewed = SharedPrefrencesService.getBool(AppConstant.onBoardingKey);
   bool isSignIn  = FirebaseAuthServices().isUserLoggedIn();

    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        isViewed
            ? (isSignIn ? OnGenerateRout.homeView : OnGenerateRout.signIn)
            : OnGenerateRout.onBoardingView,
      ),
    );
  }

  @override
  void initState() {
    _initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                Assets.imagesSvgPlantLogo,
              ),
            ],
          ),
          SvgPicture.asset(Assets.imagesSvgFruitLogoSplash),
          SvgPicture.asset(
            Assets.imagesSvgFooterLogo,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
