import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/features/best_saler/presentation/view/best_saler.dart';
import 'package:fruit/features/check_order/presentation/module/check_order.dart';
import 'package:fruit/features/check_order/presentation/widgets/steps_item.dart';

class CheckOrderViewBody extends StatefulWidget {
  const CheckOrderViewBody({super.key});
  @override
  State<CheckOrderViewBody> createState() => _CheckOrderViewBodyState();
}

class _CheckOrderViewBodyState extends State<CheckOrderViewBody> {
  late PageController? pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarApp(
        title: 'الشحن',
        showNotification: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: List.generate(
                    CheckOrderSteps.checkOrderSteps().length, (index) {
                  return Expanded(
                      child: StepsItem(
                    title: CheckOrderSteps.checkOrderSteps()[index],
                    index: '${index + 1}',
                    isActive: index == 0 ? true : false,
                  ));
                }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageView.builder(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CheckOrderSteps.checkOrderPages()[index];
                    },
                  ),
                ),
              ),
              CustomElevatedButton(
                title: 'التالي',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
