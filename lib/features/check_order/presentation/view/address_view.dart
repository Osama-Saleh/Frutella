import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';
import 'package:fruit/features/check_order/presentation/widgets/adress_view_body.dart';

class AddressView extends StatelessWidget {
  late TextEditingController? nameController;

  late TextEditingController? emailController;

  late TextEditingController? addressController;

  late TextEditingController? cityController;

  late TextEditingController? apartmentController;

  late TextEditingController? phoneController;
  late GlobalKey<FormState>? formStateKey;

   AddressView({super.key, this.nameController,
    this.emailController,
    this.addressController,
    this.cityController,
    this.apartmentController,
    this.phoneController,
    this.formStateKey
    });

  @override
  Widget build(BuildContext context) {
    return AddressViewBody(
      nameController: nameController,
      emailController: emailController,
      addressController: addressController,
      cityController: cityController,
      apartmentController: apartmentController,
      phoneController: phoneController,
      formStateKey: formStateKey,
    );
  }
}