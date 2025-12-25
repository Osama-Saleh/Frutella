import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/view/address_view.dart';
import 'package:fruit/features/check_order/presentation/view/payment_view.dart';
import 'package:fruit/features/check_order/presentation/widgets/shipping_sections.dart';

class CheckOrderSteps {
  static List<String> checkOrderSteps() {
    return [
      'الشحن',
      'العنوان',
      'الدفع',
    ];
  }

  static List<Widget> checkOrderPages() {
    return [
      ShippingSections(),
      AddressView(),
      PaymentView(),
    ];
  }

  static String getTileButtonStep(int index) {
    switch (index) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع من خلال paypal';
      default:
        return 'التالي';
    }
  }
}
