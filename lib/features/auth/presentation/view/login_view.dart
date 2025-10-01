import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';
import 'package:fruit/features/auth/presentation/widgets/social_media.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تسجيل دخول',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16.h,
            children: [
              CustomTextFormFiled(
                controller: emailController,
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormFiled(
                controller: passController,
                hintText: 'كلمة المرور',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined,size: 20.sp,),
              ),
              Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style:
                        AppTextStyles.bold13.copyWith(color: Color(0xff2D9F5D)),
                  )),
                  SizedBox(height: 2.h,),
              CustomElevatedButton(
                title: 'تسجيل دخول',
                onPressed: () {},
              ),
                  SizedBox(height: 0.5.h,),
        
              Text.rich(
                TextSpan(
                  text: 'لا تمتلك حساب؟ ',
                  style: AppTextStyles.semiBold16.copyWith(
                    color: Color(0xff7C8D8E),
                  ),
                  children: [
                    TextSpan(
                      text: 'قم بإنشاء حساب',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context,OnGenerateRout.signUpView);
                        },
                      style: AppTextStyles.bold16.copyWith(
                        color: Color(0xff1B5E37),
                      ),
                    ),
                  ],
                ),
              ),
                  SizedBox(height: 0.01.h,),
        
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xffDDDFDF),
                      thickness: 1,
                      endIndent: 10.w,
                      indent: 10.w,
                    ),
                  ),
                  Text('أو', style: AppTextStyles.semiBold16),
                  Expanded(
                    child: Divider(
                      color: Color(0xffDDDFDF),
                      thickness: 1,
                      endIndent: 10.w,
                      indent: 10.w,
                    ),
                  ),
                ],
              ),
              SocialMedia(
                svgImage: Assets.imagesSvgAuthGoogle,
                title: 'تسجيل الدخول بواسطة جوجل',
                onTap: () {},
              ),
              SocialMedia(
                svgImage: Assets.imagesSvgAuthApple,
                title: 'تسجيل الدخول بواسطة أبل',
                onTap: () {},
              ),
              SocialMedia(
                svgImage: Assets.imagesSvgAuthFacebook,
                title: 'تسجيل الدخول بواسطة فيسبوك',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

