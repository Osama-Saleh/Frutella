import 'package:fruit/core/entities/add_product_input_entities.dart';

ProductInputEntities getDummyProduct(){

  return ProductInputEntities(
   productName: "Fresh Organic Apple",
  price: 25,
  code: "APL-2025",
  description: "High-quality fresh organic apple imported from Italy.",
  urlImage: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg",
  isFeatureProduct: true,
  exprirationMonth: 6,
  isOrganicProduct: true,
  numberOfCalories: 95,
  unitCount: 12,
  avgRating: 4,
  ratingCount: 128,
  reviews: [
    {
      "id": "review1",
      "username": "User A",
      "message": "Very tasty and fresh!",
      "rating": 5,
    },
    {
      "id": "review2",
      "username": "User B",
      "message": "Good quality for the price.",
      "rating": 4,
    },
  ],
  sellingCount: 340,
  );
}

List<ProductInputEntities> getDummyProducts = [
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
  getDummyProduct(),
];