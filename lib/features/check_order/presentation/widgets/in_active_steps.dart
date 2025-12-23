import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class InActiveSteps extends StatelessWidget {
  final String index;
  final String title;
  const InActiveSteps({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5.r,
          backgroundColor: AppColors.veryLightGreenColor,
          child: Text(
            index,
            style: AppTextStyles.semiBold13,
          ),
        ),
        SizedBox(width: 4.w),
        Text(title,
            style:
                AppTextStyles.semiBold13.copyWith(color: AppColors.grayColor)),
      ],
    );
  }
}
