import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/features/home/presentation/widgets/buttom_feature_item.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    double isWidth = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: isWidth * .4,
              child: SvgPicture.asset(
                Assets.imagesOnBoardingFruitBasketPage2,
              )),
          Container(
            width: isWidth * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
              image: DecorationImage(
                image: svgProvider.Svg(Assets.imagesHomeBackgroundFeatersItem),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'عروض العيد',
                    style:
                        AppTextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    'خصم 25%',
                    style: AppTextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  ButtomFeatureItem(
                    title: 'تسوق الان',
                    onPressed: () {},
                  ),
                  Flexible(
                      child: SizedBox(
                    height: 29.h,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
