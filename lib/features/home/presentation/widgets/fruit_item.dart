import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: AppColors.grayLighColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4.w,
            right: 4.w,
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 25.h,
            child: SvgPicture.asset(Assets.imagesOnBoardingFruitBasketPage2,
                height: 115.h, width: 114.w),
          ),
          
          Positioned(
            left: 0,
            right: 0,
            bottom: 12.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'فراولة',
                        style: AppTextStyles.semiBold13,
                      ),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: '30جنية',
                              style: AppTextStyles.bold13
                                  .copyWith(color: AppColors.orangeColor)),
                          TextSpan(
                              text: ' / الكيلو ',
                              style: AppTextStyles.regular13
                                  .copyWith(color: AppColors.orangeLighColor)),
                        ],
                      ))
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
