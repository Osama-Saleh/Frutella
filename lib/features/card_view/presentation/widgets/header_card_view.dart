import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/features/card_view/card/card_cubit.dart';

class HeaderCardView extends StatelessWidget {
  const HeaderCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.veryLightGreenColor,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Center(
        child: Text(
            'لديك ${context.read<CardItemCubit>().state.cardItemEntitys.length} منتجات في سله التسوق'),
      ),
    );
  }
}
