import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? mailController = TextEditingController();
  final TextEditingController? passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
