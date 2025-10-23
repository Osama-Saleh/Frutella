import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الأكثر مبيعًا',
          style: AppTextStyles.bold16,
        ),
        Spacer(),
        Text(
          'المزيد',
          style: AppTextStyles.regular13.copyWith(
            color: AppColors.grayColor,
          ),
        ),
      ],
    );
  }
}
