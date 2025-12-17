import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';

class CardItemState {
  List<CardItemEntity> cardItemEntitys;

  CardItemState({this.cardItemEntitys = const []});
  CardItemState copyWith({List<CardItemEntity>? cardItemEntitys}) {
    return CardItemState(
      cardItemEntitys: cardItemEntitys ?? this.cardItemEntitys,
    );
  }
}
