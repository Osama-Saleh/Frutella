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

  GlobalKey<FormState>? formStateKey;

  AddressViewBody({
    super.key,
    this.nameController,
    this.emailController,
    this.addressController,
    this.cityController,
    this.apartmentController,
    this.phoneController,
    this.formStateKey,
  });

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: widget.formStateKey,
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
      ),
    );
  }
}
