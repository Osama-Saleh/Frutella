import 'package:fruit/features/check_order/presentation/module/address_model.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';
import 'package:fruit/features/check_order/presentation/module/product_fireb_model.dart';

class OrderModel {
  final double totalPrice;
  final String userId;
  final AddressModel address;
  final List<ProductFirebModel> products;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.userId,
      required this.address,
      required this.products,
      required this.paymentMethod});
  factory OrderModel.fromEntity(CheckOrderEntity entity) {
    return OrderModel(
      totalPrice: entity.cardItemEntitys != null
          ? entity.cardItemEntitys!
              .fold(0.0, (sum, item) => sum + item.product.price * item.count)
          : 0.0,
      userId: entity.userId,
      address: AddressModel.fromEntity(entity.checkOrderAddressEntity!),
      products: entity.cardItemEntitys != null
          ? entity.cardItemEntitys!
              .map((item) => ProductFirebModel(
                    productName: item.product.productName,
                    price: item.product.price,
                    code: item.product.code,
                    description: item.product.description,
                  ))
              .toList()
          : [],
      paymentMethod: entity.isCache! ? 'cash' : 'online',
    );
  }
  toJson() {
    return {
      'totalPrice': totalPrice,
      'userId': userId,
      'address': address.toJson(),
      'products': products.map((product) => product.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
