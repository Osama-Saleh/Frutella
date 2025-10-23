import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruit/features/home/presentation/widgets/custom_search_text_form_field.dart';
import 'package:fruit/features/home/presentation/widgets/feature_item.dart';
import 'package:fruit/features/home/presentation/widgets/feature_items_list.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});
  final TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
            child: Column(
              spacing: 16.h,
              children: [
                CustomHomeAppBar(),
                CustomSearchTextFormField(
                    controller: controller, hintText: 'ابحث عن.......'),
                FeatureItemsList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
