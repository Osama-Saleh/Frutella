import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
                text: '',
                children: [
    TextSpan(
      text: 'تمتلك حساب بالفعل؟ ',
      style: AppTextStyles.semiBold16.copyWith(
        color: Colors.grey,
      ),
    ),
    TextSpan(
      text: ' تسجيل دخول',
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          Navigator.pop(context);
        },
      style: AppTextStyles.semiBold16.copyWith(
        color: AppColors.primaryColor,
      ),
    ),
                ],
              ));
  }
}

