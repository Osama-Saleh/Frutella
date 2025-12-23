import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/widgets/shipping_item.dart';

class ShippingSections extends StatelessWidget {
  const ShippingSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(),
      ],
    );
  }
}