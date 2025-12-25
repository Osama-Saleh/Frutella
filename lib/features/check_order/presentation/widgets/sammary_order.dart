import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helper/shape_container.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class SammaryOrder extends StatelessWidget {
  const SammaryOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        SizedBox(
          height: 16.h,
        ),
        Text(
          'ملخص الطلب :',
          style: AppTextStyles.bold13,
        ),
        Container(
          decoration: ShapeContainer.grayBoxDecoration(),
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 12.h,
            right: 4.w,
            left: 4.w,
          ),
          child: Column(
            spacing: 5.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: AppTextStyles.regular13,
                  ),
                  Text(
                    '150 جنيه',
                    style: AppTextStyles.bold16,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('التوصيل  :', style: AppTextStyles.regular13),
                  Text('30 جنية', style: AppTextStyles.semiBold13),
                ],
              ),
              Divider(
                color: AppColors.grayColor.withValues(alpha: 0.5),
                indent: 30.w,
                endIndent: 30.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الكلي', style: AppTextStyles.bold16),
                  Text('180 جنيه', style: AppTextStyles.bold16),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
