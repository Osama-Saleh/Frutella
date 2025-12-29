import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';
import 'package:fruit/features/check_order/presentation/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  CheckOrderEntity? checkOrderEntity;
  PaymentView({super.key, this.checkOrderEntity});

  @override
  Widget build(BuildContext context) {
    return PaymentViewBody(
      checkOrderEntity: checkOrderEntity,
    );
  }
}
