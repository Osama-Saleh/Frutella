import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';
import 'package:fruit/features/auth/presentation/widgets/have_an_account.dart';
import 'package:fruit/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? mailController = TextEditingController();
  final TextEditingController? passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'حساب جديد',
      leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormFiled(
                  controller: nameController, hintText: 'الاسم كامل'),
              CustomTextFormFiled(
                  controller: mailController, hintText: 'البريد الإلكتروني'),
              CustomTextFormFiled(
                controller: passController,
                hintText: 'كلمة المرور',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined,size: 20.sp,),
              ),
              TermsAndConditions(),
              CustomElevatedButton(title: 'إنشاء حساب جديد', onPressed: () {
              },),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}