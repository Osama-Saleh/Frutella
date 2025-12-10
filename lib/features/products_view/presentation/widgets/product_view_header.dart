import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class ProductViewHeader extends StatelessWidget {
  final int productsNumber;
  const ProductViewHeader({
    super.key,
    required this.productsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${productsNumber} نتائج',
          style: AppTextStyles.bold16,
        ),
        Spacer(),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: AppColors.grayColor)),
            child: SvgPicture.asset(Assets.imagesHomeFilter2)),
      ],
    );
  }
}
