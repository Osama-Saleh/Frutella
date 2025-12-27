import 'package:fruit/features/card_view/domain/card_item_entity.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_address_model.dart';

class CheckOrderModel {
  List<CardItemEntity>? cardItemEntitys;
  bool? isCache;
  CheckOrderAddressModel? checkOrderAddressModel;

  CheckOrderModel({
    required this.cardItemEntitys,
    this.isCache,
    this.checkOrderAddressModel,
  });


  }
