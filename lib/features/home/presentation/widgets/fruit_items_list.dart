import 'package:flutter/material.dart';
import 'package:fruit/features/home/presentation/widgets/fruit_item.dart';

class FruitItemsList extends StatelessWidget {
  const FruitItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163/214,
          mainAxisSpacing: 8,
          crossAxisSpacing:12
          ),
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
