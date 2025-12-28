import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/helper/shape_container.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_address_model.dart';

class DeleverLocation extends StatelessWidget {
  final CheckOrderAddressModel checkOrderAddressModel;
  const DeleverLocation({
    super.key,
    required this.checkOrderAddressModel,
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8.w,
            children: [
              SvgPicture.asset(Assets.imagesHomeLocationLogo),
              Text(
                '${checkOrderAddressModel.adress} , ${checkOrderAddressModel.city} , ${checkOrderAddressModel.adressDetails}',
                style: AppTextStyles.regular13,
              ),
              Spacer(),
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
