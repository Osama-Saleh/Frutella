import 'dart:ffi';

import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';

class CardItemState {
  List<CardItemEntity> cardItemEntitys;
  bool isUpdateCard = false;

  CardItemState({this.cardItemEntitys = const [], this.isUpdateCard = false});
  CardItemState copyWith({List<CardItemEntity>? cardItemEntitys, bool? isUpdateCard}) {
    return CardItemState(
      cardItemEntitys: cardItemEntitys ?? this.cardItemEntitys,
      isUpdateCard: isUpdateCard ?? this.isUpdateCard,
    );
  }
}
