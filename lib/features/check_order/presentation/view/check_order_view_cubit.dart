import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/features/check_order/presentation/cubit/check_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CheckOrderViewCubit extends StatelessWidget {
  final Widget child;
  const CheckOrderViewCubit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOrderCubit, CheckOrderState>(
      listener: (context, state) {
        if (state.checkOrderStatus == CheckOrderStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
          );
        }
        if (state.checkOrderStatus == CheckOrderStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Order placed successfully')),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state.checkOrderStatus == CheckOrderStatus.loading,
            child: child);
      },
    );
  }
}
