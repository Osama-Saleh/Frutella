import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_model.dart';
import 'package:fruit/features/check_order/presentation/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  CheckOrderModel? checkOrderModel;
  PaymentView({super.key, this.checkOrderModel});

  @override
  Widget build(BuildContext context) {
    return PaymentViewBody(
      checkOrderModel: checkOrderModel,
    );
  }
}
