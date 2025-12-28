import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

class AddressViewBody extends StatefulWidget {
  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? addressController;

  TextEditingController? cityController;

  TextEditingController? apartmentController;

  TextEditingController? phoneController;

  AddressViewBody({
    super.key,
    this.nameController,
    this.emailController,
    this.addressController,
    this.cityController,
    this.apartmentController,
    this.phoneController,
  });
  //    {
  //   nameController ??= TextEditingController();
  //   emailController ??= TextEditingController();
  //   addressController ??= TextEditingController();
  //   cityController ??= TextEditingController();
  //   apartmentController ??= TextEditingController();
  //   phoneController ??= TextEditingController();
  // }

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  @override
  void dispose() {
    widget.nameController?.dispose();
    widget.emailController?.dispose();
    widget.addressController?.dispose();
    widget.cityController?.dispose();
    widget.apartmentController?.dispose();
    widget.phoneController?.dispose();
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
                controller: widget.nameController, hintText: 'الاسم كامل'),
            CustomTextFormFiled(
                controller: widget.emailController,
                hintText: 'البريد الإلكتروني'),
            CustomTextFormFiled(
                controller: widget.addressController, hintText: 'العنوان'),
            CustomTextFormFiled(
                controller: widget.cityController, hintText: 'المدينه'),
            CustomTextFormFiled(
                controller: widget.apartmentController,
                hintText: 'رقم الطابق , رقم الشقه ..'),
            CustomTextFormFiled(
                controller: widget.phoneController, hintText: 'رقم الهاتف'),
          ],
        ),
      ),
    );
  }
}
