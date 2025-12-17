import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';

class CardItem extends StatelessWidget {
  final CardItemEntity cardItemEntity;
  const CardItem({super.key, required this.cardItemEntity});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 90,
              decoration: BoxDecoration(color: AppColors.grayColor),
              child: Image.network(
                cardItemEntity.product.urlImage!,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(
              width: 17.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(cardItemEntity.product.productName, style: AppTextStyles.bold13),
                      Spacer(),
                      SvgPicture.asset(Assets.imagesSvgSalla)
                    ],
                  ),
                  Text(
                    '${cardItemEntity.product.unitCount}  كم',
                    style: AppTextStyles.regular13
                        .copyWith(color: AppColors.orangeLighColor),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    spacing: 10.w,
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FittedBox(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${cardItemEntity.count}',
                        style: AppTextStyles.bold16,
                      ),
                      InkWell(
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AppColors.grayLighColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FittedBox(
                                child: Icon(Icons.remove,
                                    color: AppColors.grayColor)),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${cardItemEntity.product.price} جنيه',
                        style: AppTextStyles.bold16
                            .copyWith(color: AppColors.orangeColor),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
