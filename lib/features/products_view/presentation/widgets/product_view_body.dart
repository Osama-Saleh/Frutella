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
import 'package:fruit/features/products_view/presentation/widgets/product_view_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductViewBody extends StatefulWidget {
  final TextEditingController? controller;
  const ProductViewBody({
    super.key,
    this.controller,
  });

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

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
                BestSalerAppBar(),
                CustomSearchTextFormField(
                    controller: widget.controller, hintText: 'ابحث عن.......'),
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return ProductViewHeader(
                        productsNumber: state.productInputEntities.length);
                  },
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state.productSuccess) {
              return FruitItemsList(
                products: state.productInputEntities,
              );
            } else if (state.productFailure) {
              return SliverToBoxAdapter(
                  child: CustomErrorMessage(
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
