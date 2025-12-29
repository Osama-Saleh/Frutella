import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/cubit/products_cubit/products_cubit.dart';
import 'package:fruit/core/cubit/products_cubit/products_state.dart';
import 'package:fruit/core/helper/custom_error_message.dart';
import 'package:fruit/core/helper/dummy_product.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
import 'package:fruit/features/home/presentation/widgets/best_seller_widget.dart';
import 'package:fruit/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruit/features/home/presentation/widgets/custom_search_text_form_field.dart';
import 'package:fruit/features/home/presentation/widgets/feature_items_list.dart';
import 'package:fruit/features/home/presentation/widgets/fruit_items_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatefulWidget {
  HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController? controller = TextEditingController();
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    // TODO: implement initState
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
                CustomHomeAppBar(),
                CustomSearchTextFormField(
                    controller: controller, hintText: 'ابحث عن.......'),
                FeatureItemsList(),
                GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, OnGenerateRout.bestSaler),
                    child: BestSellerWidget()),
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
