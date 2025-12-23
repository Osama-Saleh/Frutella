import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/card_view/card/card_cubit.dart';
import 'package:fruit/features/card_view/card/card_state.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';

class CardItem extends StatelessWidget {
  final CardItemEntity cardItemEntity;
  const CardItem({super.key, required this.cardItemEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardItemCubit, CardItemState>(
      buildWhen: (oldState, newState) {
        if (newState.isUpdateCard) {
          newState.cardItemEntitys.firstWhere(
              (item) => item.product.code == cardItemEntity.product.code);
          return true;
        }
        return false;
      },
      builder: (context, state) {
        log('Build Card Item');
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
                          Text(cardItemEntity.product.productName,
                              style: AppTextStyles.bold13),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                context.read<CardItemCubit>().removeCardItem(
                                      productInputEntities:
                                          cardItemEntity.product,
                                    );
                              },
                              child: SvgPicture.asset(Assets.imagesSvgSalla))
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
                            onTap: () {
                              context.read<CardItemCubit>().addCardItem(
                                    productInputEntities:
                                        cardItemEntity.product,
                                  );
                            },
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
                            onTap: context
                                        .watch<CardItemCubit>()
                                        .state
                                        .cardItemEntitys
                                        .firstWhere((item) =>
                                            item.product ==
                                            cardItemEntity.product)
                                        .count >
                                    1
                                ? () {
                                    if (cardItemEntity.count > 1) {
                                      context
                                          .read<CardItemCubit>()
                                          .decreaseCardItem(
                                            productInputEntities:
                                                cardItemEntity.product,
                                          );
                                    }
                                  }
                                : null,
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: context
                                          .watch<CardItemCubit>()
                                          .state
                                          .cardItemEntitys
                                          .firstWhere((item) =>
                                              item.product ==
                                              cardItemEntity.product)
                                          .count >
                                      1
                                  ? AppColors.primaryColor
                                  : AppColors.grayLighColor,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: FittedBox(
                                    child: Icon(Icons.remove,
                                        color: context
                                                    .watch<CardItemCubit>()
                                                    .state
                                                    .cardItemEntitys
                                                    .firstWhere((item) =>
                                                        item.product ==
                                                        cardItemEntity.product)
                                                    .count >
                                                1
                                            ? Colors.white
                                            : AppColors.grayColor)),
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
      },
    );
  }
}
