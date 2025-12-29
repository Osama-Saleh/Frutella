import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/repos/orders/order_repo.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/features/check_order/presentation/cubit/check_order_cubit.dart';
import 'package:fruit/features/check_order/presentation/view/check_order_view_cubit.dart';
import 'package:fruit/features/check_order/presentation/widgets/check_order_view_body.dart';

class CheckOrderView extends StatelessWidget {
  const CheckOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOrderCubit(getIt.get<OrderRepo>()),
      child: CheckOrderViewCubit(child: CheckOrderViewBody()),
    );
  }
}
