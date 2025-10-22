import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/app_constant/app_constant.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
import 'package:fruit/core/services/shared_prefrences.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class CustomPage extends StatelessWidget {
  final String background;
  final String image;
  final Widget title;
  final String subtitle;
  final bool isSkip;

  const CustomPage({super.key,
  required this.background,
  required this.image,
  required this.title,
  required this.subtitle,
  required this.isSkip
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    background,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
                InkWell(
                  onTap: () {
                        Navigator.pushReplacementNamed(context, OnGenerateRout.signIn);
                        SharedPrefrencesService.setBool(AppConstant.onBoardingKey, true);
                      },
                  child: Visibility(
                    visible: isSkip,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,top: 10),
                      child: Text('تخط',style: AppTextStyles.regular13.copyWith(
                          color: Color(0xff949D9E)
                        ),),
                    )),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.07),
          title,

          SizedBox(height: MediaQuery.sizeOf(context).height*0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16
            ),
          ),
        ],
            ),
      ),
    );
  }
}
