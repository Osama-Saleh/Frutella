import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/helper/shape_container.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class DeleverLocation extends StatelessWidget {
  const DeleverLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          'عنوان التوصيل',
          style: AppTextStyles.bold13,
        ),
        Container(
          decoration: ShapeContainer.grayBoxDecoration(),
          padding: EdgeInsets.all(8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.imagesHomeLocationLogo),
              Text(
                '123 شارع الفواكه , مدينه نصر',
                style: AppTextStyles.regular13,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      Text('تعديل', style: AppTextStyles.semiBold13),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}