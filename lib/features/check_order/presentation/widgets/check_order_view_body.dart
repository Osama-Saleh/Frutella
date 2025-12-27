import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/custom_elevated_button.dart';
import 'package:fruit/features/check_order/presentation/module/check_order.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_model.dart';
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
    pageController?.addListener(() {
      setState(() {});
    });
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
                      return CheckOrderSteps.checkOrderPages()[index];
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
                  pageController!.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
