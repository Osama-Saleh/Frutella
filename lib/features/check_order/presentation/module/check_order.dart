import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_model.dart';
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

  static List<Widget> checkOrderPages({
    ValueChanged<int>? onSelectionChanged,
    CheckOrderModel? checkOrderModel,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? addressController,
    TextEditingController? cityController,
    TextEditingController? apartmentController,
    TextEditingController? phoneController,
  }) {
    return [
      ShippingSections(
        onSelectionChanged: onSelectionChanged,
      ),
      AddressView(
        nameController: nameController,
        emailController: emailController,
        addressController: addressController,
        cityController: cityController,
        apartmentController: apartmentController,
        phoneController: phoneController,
      ),
      PaymentView(
        checkOrderModel: checkOrderModel,
      ),
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
