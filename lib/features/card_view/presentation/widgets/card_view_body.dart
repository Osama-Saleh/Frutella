import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/features/best_saler/presentation/view/best_saler.dart';
import 'package:fruit/features/card_view/card/card_cubit.dart';
import 'package:fruit/features/card_view/presentation/widgets/card_items_list.dart';
import 'package:fruit/features/card_view/presentation/widgets/header_card_view.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CustomAppBarApp(
                        title: 'السلة',
                      ),
                      HeaderCardView(),
                    ],
                  ),
                ),
                context.read<CardItemCubit>().state.cardItemEntitys.isEmpty
                    ? SliverToBoxAdapter(
                        child: SizedBox(),
                      )
                    : SliverToBoxAdapter(
                        child: Divider(),
                      ),
                CardItemsList(
                  cardItemEntitys:
                      context.read<CardItemCubit>().state.cardItemEntitys,
                ),
                context.read<CardItemCubit>().state.cardItemEntitys.isEmpty
                    ? SliverToBoxAdapter(
                        child: SizedBox(),
                      )
                    : SliverToBoxAdapter(
                        child: Divider(),
                      ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100.h,
                  ),
                ),
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.08,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomElevatedButton(
                    title: 'الدفع  120جنيه',
                    onPressed: () {},
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
