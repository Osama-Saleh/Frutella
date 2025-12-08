import 'package:fruit/core/entities/review_entity.dart';
// import 'package:image_picker/image_picker.dart';

class ProductInputEntities {
  String productName;
  int price;
  String code;
  String description;
  // XFile? image;
  String? urlImage;
  bool isFeatureProduct;
  int exprirationMonth;
  bool isOrganicProduct;
  int numberOfCalories;
  int unitCount;
  int? avgRating = 0;
  int? ratingCount = 0;
  List<dynamic>? reviews;
  num? sellingCount = 0;
  ProductInputEntities({
    required this.productName,
    required this.description,
    required this.code,
    // required this.image,
    this.urlImage,
    required this.price,
    required this.isFeatureProduct,
    required this.exprirationMonth,
    required this.isOrganicProduct,
    required this.numberOfCalories,
    required this.unitCount,
    this.avgRating,
    this.ratingCount,
    this.reviews,
    this.sellingCount,
  });
}
