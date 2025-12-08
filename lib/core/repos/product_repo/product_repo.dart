import 'package:fruit/core/entities/add_product_input_entities.dart';

abstract class ProductRepo {
  Future<List<ProductInputEntities>> getProduct();
  Future<List<ProductInputEntities>> getBestSelleingProduct();
}