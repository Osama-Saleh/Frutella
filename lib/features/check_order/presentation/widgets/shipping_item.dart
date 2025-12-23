import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
          color: AppColors.grayLighColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          )),
      child: Row(
        children: [
          Transform.translate(
            offset: Offset(0, -7.h),
            child: Container(
              width: 18.w,
              height: 18.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grayColor),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            spacing: 4.h,
            children: [
              Text('الدفع عند الاستلام', style: AppTextStyles.semiBold13),
              Text('التسليم من المكان',
                  style: AppTextStyles.regular13.copyWith(
                    color: AppColors.grayColor,
                  )),
            ],
          ),
          Spacer(),
          Text('40 جنيه',
              style: AppTextStyles.semiBold13.copyWith(
                color: AppColors.primaryColor,
              )),
        ],
      ),
    );
  }
}
