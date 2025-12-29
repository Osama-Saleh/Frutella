import 'package:fruit/core/entities/add_product_input_entities.dart';

class ProductFirebModel {
  String productName;
  int price;
  String code;
  String description;

  ProductFirebModel({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
  });

  factory ProductFirebModel.fromEntity(ProductInputEntities entity) {
    return ProductFirebModel(
      productName: entity.productName,
      price: entity.price,
      code: entity.code,
      description: entity.description,
    );
  }

  toJson() {
    return {
      'productName': productName,
      'price': price,
      'code': code,
      'description': description,
    };
  }
}