import 'package:flutter/material.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/features/home/presentation/widgets/fruit_item.dart';

class FruitItemsList extends StatelessWidget {
  final List<ProductInputEntities> products;
  const FruitItemsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 12),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FruitItem(product: products[index]);
      },
    );
  }
}
