import 'package:equatable/equatable.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';

class ProductsState extends Equatable {
  final bool productLoading;
  final List<ProductInputEntities> productInputEntities;

  const ProductsState({
    this.productLoading = false,
    this.productInputEntities = const [],
  });

  ProductsState copyWith({
    bool? productLoading,
    List<ProductInputEntities>? productInputEntities,
  }) {
    return ProductsState(
      productLoading: productLoading ?? this.productLoading,
      productInputEntities: productInputEntities ?? this.productInputEntities,
    );
  }

  @override
  List<Object?> get props => [
        productLoading,
        productInputEntities,
      ];

  @override
  String toString() =>
      'ProductsState(productLoading: $productLoading, items: ${productInputEntities.length})';
}
