import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Transform.translate(
          offset: Offset(0, -4),
          child: InkWell(
            onTap: () {
              isChecked = !isChecked;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(color:isChecked? Colors.white  : Colors.grey.shade400),
                color: isChecked ? AppColors.lightPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ),
        Expanded(
          child: Text.rich(TextSpan(
            text: '',
            children: [
              TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على',
                style: AppTextStyles.semiBold13.copyWith(
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                text: ' الشروط والأحكام الخاصة بنا',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    
                  },
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ],
          )),
        ),
      
      ],
    );
  }
}
