import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';
import 'package:fruit/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:fruit/features/auth/presentation/cubit/signup_state.dart';
import 'package:fruit/features/auth/presentation/widgets/have_an_account.dart';
import 'package:fruit/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? mailController = TextEditingController();
  final TextEditingController? passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'حساب جديد',
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Builder(builder: (context) {
          return BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if(state.isLoaded){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إنشاء الحساب بنجاح'))
                );
              }else if(state.error != null && state.error!.isNotEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!))
                );
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                    inAsyncCall: state.isLoading,
                    color: Colors.black,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: state.autovalidateMode,
                      child: Column(
                        spacing: 16,
                        children: [
                          CustomTextFormFiled(
                              controller: nameController,
                              hintText: 'الاسم كامل'),
                          CustomTextFormFiled(
                              controller: mailController,
                              hintText: 'البريد الإلكتروني'),
                          CustomTextFormFiled(
                            controller: passController,
                            hintText: 'كلمة المرور',
                            obscureText: true,
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              size: 20.sp,
                            ),
                          ),
                          TermsAndConditions(),
                          CustomElevatedButton(
                            title: 'إنشاء حساب جديد',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                context
                                    .read<SignupCubit>()
                                    .createAccountWithEmailAndPassword(
                                      email: mailController!.text,
                                      password: passController!.text,
                                      name: nameController!.text,
                                    );
                              } else {
                                context
                                    .read<SignupCubit>()
                                    .changeAutovalidateMode(
                                        AutovalidateMode.always);
                              }
                            },
                          ),
                          HaveAnAccount(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
