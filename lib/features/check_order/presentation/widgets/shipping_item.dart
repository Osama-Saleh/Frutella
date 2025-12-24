import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final void Function() onTap;
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
              color: AppColors.grayLighColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.grayLighColor,
                  width: 2.w,
                ),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border: Border.all(color: Colors.white, width: 4.w),
                        shape: BoxShape.circle,
                      ),
                    )
                  : Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grayColor),
                        shape: BoxShape.circle,
                      ),
                    ),
              SizedBox(width: 8.w),
              Column(
                spacing: 4.h,
                children: [
                  Text(title, style: AppTextStyles.semiBold13),
                  Text(subtitle,
                      style: AppTextStyles.regular13.copyWith(
                        color: AppColors.grayColor,
                      )),
                ],
              ),
              Spacer(),
              Center(
                child: Text('${price} جنيه',
                    style: AppTextStyles.semiBold13.copyWith(
                      color: AppColors.primaryColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
