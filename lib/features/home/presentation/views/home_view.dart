import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/features/home/presentation/navigationbar/navigationbar_cubit.dart';
import 'package:fruit/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      child: BlocProvider(
        create: (context) => NavigationbarCubit(),
        child: Scaffold(
          body: SafeArea(child: HomeViewBody()),
          bottomSheet: CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}
