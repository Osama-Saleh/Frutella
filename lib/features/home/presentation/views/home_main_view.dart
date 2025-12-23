import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/features/card_view/presentation/view/card_view.dart';
import 'package:fruit/features/home/presentation/navigationbar/navigationbar_cubit.dart';
import 'package:fruit/features/home/presentation/views/home_view.dart';
import 'package:fruit/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit/features/products_view/presentation/view/product_view.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      child: Scaffold(
        body: BlocListener<NavigationbarCubit, int>(
          listener: (context, state) {
            // Handle navigation changes here if needed
          },
          child: IndexedStack(
            index: context.watch<NavigationbarCubit>().index,
            children: [
              HomeView(),
              ProductView(),
              CardView(),
            ],
          ),
        ),
        bottomSheet: CustomBottomNavigationBar(),
      ),
    );
  }
}
