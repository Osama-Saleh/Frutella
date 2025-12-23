import 'package:flutter/material.dart';
import 'package:fruit/features/check_order/presentation/widgets/active_steps.dart';
import 'package:fruit/features/check_order/presentation/widgets/in_active_steps.dart';

class StepsItem extends StatelessWidget {
  final String title;
  final String index;
  final bool isActive;
  const StepsItem({super.key, required this.title, required this.index
  , required this.isActive
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InActiveSteps(title: title, index: index),
        secondChild: ActiveSteps(title: title),
        crossFadeState:
            isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 300));
  }
}
