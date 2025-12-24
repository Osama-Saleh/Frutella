import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

class AddressViewBody extends StatefulWidget {
  AddressViewBody({super.key});

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? addressController;

  TextEditingController? cityController;

  TextEditingController? apartmentController;

  TextEditingController? phoneController;
  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    addressController?.dispose();
    cityController?.dispose();
    apartmentController?.dispose();
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 8.h,
          children: [
            SizedBox(height: 20.h),
            CustomTextFormFiled(
                controller: nameController, hintText: 'الاسم كامل'),
            CustomTextFormFiled(
                controller: emailController, hintText: 'البريد الإلكتروني'),
            CustomTextFormFiled(
                controller: addressController, hintText: 'العنوان'),
            CustomTextFormFiled(
                controller: cityController, hintText: 'المدينه'),
            CustomTextFormFiled(
                controller: apartmentController,
                hintText: 'رقم الطابق , رقم الشقه ..'),
            CustomTextFormFiled(
                controller: phoneController, hintText: 'رقم الهاتف'),
          ],
        ),
      ),
    );
  }
}
