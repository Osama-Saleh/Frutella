import 'package:flutter/material.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';
import 'package:fruit/features/card_view/presentation/widgets/card_item.dart';

class CardItemsList extends StatelessWidget {
  final List<CardItemEntity> cardItemEntitys;
  const CardItemsList({super.key, required this.cardItemEntitys});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              CardItem(cardItemEntity: cardItemEntitys[index],),
            ],
          );
        },
        itemCount: cardItemEntitys.length,
        separatorBuilder: (context, index) => Divider());
  }
}
