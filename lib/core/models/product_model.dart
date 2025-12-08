import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/core/models/review_model.dart';

class ProductModel extends ProductInputEntities {
  ProductModel({
    required super.productName,
    required super.description,
    required super.code,
    super.image,
    required super.price,
    required super.urlImage,
    required super.isFeatureProduct,
    required super.exprirationMonth,
    required super.isOrganicProduct,
    required super.numberOfCalories,
    required super.unitCount,
    super.avgRating,
    super.ratingCount,
    super.reviews,
    super.sellingCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'description': description,
      'code': code,
      'price': price,
      'urlImage': urlImage,
      'isFeatureProduct': isFeatureProduct,
      'exprirationMonth': exprirationMonth,
      'isOrganicProduct': isOrganicProduct,
      'numberOfCalories': numberOfCalories,
      'unitCount': unitCount,
      'sellingCount': sellingCount,
      'reviews': reviews
          ?.map(
            (e) => ReviewModel.fromEntity(e).toMap(),
          )
          .toList(),
    };
  }

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      description: json['description'],
      code: json['code'],
      price: json['price'],
      urlImage: json['urlImage'],
      isFeatureProduct: json['isFeatureProduct'],
      exprirationMonth: json['exprirationMonth'],
      isOrganicProduct: json['isOrganicProduct'],
      numberOfCalories: json['numberOfCalories'],
      unitCount: json['unitCount'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}
