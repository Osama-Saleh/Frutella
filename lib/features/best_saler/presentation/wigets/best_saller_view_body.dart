import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/cubit/products_cubit/products_cubit.dart';
import 'package:fruit/core/cubit/products_cubit/products_state.dart';
import 'package:fruit/core/helper/custom_error_message.dart';
import 'package:fruit/core/helper/dummy_product.dart';
import 'package:fruit/features/best_saler/presentation/view/best_saler.dart';
import 'package:fruit/features/home/presentation/widgets/custom_search_text_form_field.dart';
import 'package:fruit/features/home/presentation/widgets/fruit_items_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSallerViewBody extends StatelessWidget {
  final TextEditingController? controller;
  const BestSallerViewBody({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0).w,
            child: Column(
              spacing: 16.h,
              children: [
                CustomAppBarApp(
                  title: 'الأكثر مبيعًا',
                ),
                CustomSearchTextFormField(
                    controller: controller, hintText: 'ابحث عن.......'),
                // FeatureItemsList(),
                //   GestureDetector(
                //       onTap: () =>
                //           Navigator.pushNamed(context, OnGenerateRout.bestSaler),
                //       child: BestSellerWidget()),
              ],
            ),
          ),
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state.productSuccess) {
              return FruitItemsList(
                products: getDummyProducts,
                // products: state.productInputEntities,
              );
            } else if (state.productFailure) {
              return SliverToBoxAdapter(
                  child: ShowErrorMessage(
                      errorMessage: 'Failed to load products'));
            }
            return Skeletonizer.sliver(
                child: FruitItemsList(products: getDummyProducts));
          },
        ),
      ],
    );
  }
}
