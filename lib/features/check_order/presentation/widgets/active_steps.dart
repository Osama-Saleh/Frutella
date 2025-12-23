import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class ActiveSteps extends StatelessWidget {
  final String title;
  const ActiveSteps({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: AppColors.primaryColor),
        SizedBox(width: 4.w),
        Text(title,
            style: AppTextStyles.semiBold13
                .copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}
