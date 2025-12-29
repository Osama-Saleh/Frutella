import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/helper/get_user_data.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/features/card_view/card/card_cubit.dart';
import 'package:fruit/features/check_order/presentation/cubit/check_order_cubit.dart';
import 'package:fruit/features/check_order/presentation/module/check_order.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_address_model.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';
import 'package:fruit/features/check_order/presentation/widgets/steps_item.dart';

class CheckOrderViewBody extends StatefulWidget {
  const CheckOrderViewBody({super.key});
  @override
  State<CheckOrderViewBody> createState() => _CheckOrderViewBodyState();
}

class _CheckOrderViewBodyState extends State<CheckOrderViewBody> {
  late PageController? pageController;
  int selectedShippingIndex = -1;
  CheckOrderEntity checkOrderEntity = CheckOrderEntity(
    cardItemEntitys: [],
    userId: '',
  );
  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? addressController;

  TextEditingController? cityController;

  TextEditingController? apartmentController;

  TextEditingController? phoneController;
  var formStateKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController = PageController();
    pageController?.addListener(() {
      setState(() {});
    });
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    apartmentController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
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
      appBar: AppBar(
        title: Text(pageController!.hasClients
            ? CheckOrderSteps.checkOrderSteps()[pageController!.page!.toInt()]
            : CheckOrderSteps.checkOrderSteps()[0]),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            if (pageController!.page == 0) {
              Navigator.pop(context);
              return;
            }
            pageController!.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: List.generate(
                    CheckOrderSteps.checkOrderSteps().length, (index) {
                  return Flexible(
                    child: GestureDetector(
                      onTap: () {
                        pageController!.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: StepsItem(
                        title: CheckOrderSteps.checkOrderSteps()[index],
                        index: '${index + 1}',
                        isActive: index <=
                                (pageController!.hasClients
                                    ? pageController!.page!.toInt()
                                    : 0)
                            ? true
                            : false,
                      ),
                    ),
                  );
                }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageView.builder(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CheckOrderSteps.checkOrderPages(
                          onSelectionChanged: (value) {
                            selectedShippingIndex = value;
                            setState(() {});
                          },
                          checkOrderEntity: checkOrderEntity,
                          nameController: nameController,
                          emailController: emailController,
                          addressController: addressController,
                          cityController: cityController,
                          apartmentController: apartmentController,
                          phoneController: phoneController,
                          formStateKey: formStateKey)[index];
                    },
                  ),
                ),
              ),
              CustomElevatedButton(
                title: CheckOrderSteps.getTileButtonStep(
                    pageController!.hasClients
                        ? pageController!.page!.toInt()
                        : 0),
                onPressed: () {
                  if (selectedShippingIndex >= 0) {
                    checkOrderEntity = CheckOrderEntity(
                      cardItemEntitys:
                          context.read<CardItemCubit>().state.cardItemEntitys,
                      isCache: selectedShippingIndex == 0 ? true : false,
                      userId: GetUserData().uid,
                      checkOrderAddressEntity: CheckOrderAddressEntity(
                        name: nameController?.text ?? '',
                        mail: emailController?.text ?? '',
                        adress: addressController?.text ?? '',
                        city: cityController?.text ?? '',
                        adressDetails: apartmentController?.text ?? '',
                        phone: phoneController?.text ?? '',
                      ),
                    );
                    if (pageController!.page!.toInt() == 1) {
                      if (!(formStateKey.currentState?.validate() ?? false)) {
                        return;
                      }
                    }
                    if (pageController!.page!.toInt() == 2) {
                      context
                          .read<CheckOrderCubit>()
                          .addOrder(checkOrderEntity: checkOrderEntity);
                      return;
                    }

                    pageController!.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
