import 'package:equatable/equatable.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';

class ProductsState extends Equatable {
  final bool productLoading;
  final bool productSuccess;
  final bool productFailure;
  final List<ProductInputEntities> productInputEntities;

  const ProductsState({
    this.productLoading = false,
    this.productSuccess = false,
    this.productFailure = false,
    this.productInputEntities = const [],
  });

  ProductsState copyWith({
    bool? productLoading,
    bool? productSuccess,
    bool? productFailure,
    List<ProductInputEntities>? productInputEntities,
  }) {
    return ProductsState(
      productLoading: productLoading ?? this.productLoading,
      productSuccess: productSuccess ?? this.productSuccess,
      productFailure: productFailure ?? this.productFailure,
      productInputEntities: productInputEntities ?? this.productInputEntities,
    );
  }

  @override
  List<Object?> get props => [
        productLoading,
        productSuccess,
        productFailure,
        productInputEntities,
      ];

  @override
  String toString() =>
      'ProductsState(productLoading: $productLoading, productSuccess: $productSuccess, productFailure: $productFailure, items: ${productInputEntities.length})';
}
