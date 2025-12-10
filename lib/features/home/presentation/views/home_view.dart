import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/cubit/products_cubit/products_cubit.dart';
import 'package:fruit/core/repos/product_repo/product_repo.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/features/home/presentation/navigationbar/navigationbar_cubit.dart';
import 'package:fruit/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationbarCubit(),
      child: Scaffold(
        body: SafeArea(
            child: BlocProvider(
          create: (context) => ProductsCubit(
            getIt.get<ProductRepo>(),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 50),
            child: HomeViewBody(),
          ),
        )),
      ),
    );
  }
}
