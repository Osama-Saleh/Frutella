import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/check_order/presentation/widgets/delever_location.dart';
import 'package:fruit/features/check_order/presentation/widgets/sammary_order.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        SammaryOrder(),
        DeleverLocation(),
      ],
    );
  }
}
