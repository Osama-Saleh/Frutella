import 'package:fruit/features/card_view/domain/card_item_entity.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_address_model.dart';

class CheckOrderEntity {
  List<CardItemEntity>? cardItemEntitys;
  bool? isCache;
  CheckOrderAddressEntity? checkOrderAddressEntity;
  String userId;

  CheckOrderEntity({
    required this.userId,
    required this.cardItemEntitys,
    this.isCache,
    this.checkOrderAddressEntity,
  });
}
