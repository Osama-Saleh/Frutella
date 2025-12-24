import 'package:flutter/material.dart';
import 'package:fruit/features/address/presentation/view/address_view.dart';
import 'package:fruit/features/check_order/presentation/widgets/shipping_sections.dart';

class CheckOrderSteps {
  static List<String> checkOrderSteps() {
    return [
      'الشحن',
      'العنوان',
      'الدفع',
      'المراجعة',
    ];
  }

  static List<Widget> checkOrderPages() {
    return [
      ShippingSections(),
      AddressView(),
      Text('Payment Page'),
      Text('Review Page'),
    ];
  }
}
