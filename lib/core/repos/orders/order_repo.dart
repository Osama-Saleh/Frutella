import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';

abstract class OrderRepo {
  Future<void> addProduct({required CheckOrderEntity checkOrderEntity}) ;
}