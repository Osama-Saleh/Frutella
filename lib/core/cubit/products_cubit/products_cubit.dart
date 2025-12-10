import 'package:bloc/bloc.dart';
import 'package:fruit/core/cubit/products_cubit/products_state.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/core/repos/product_repo/product_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo productRepo;
  ProductsCubit(this.productRepo) : super(ProductsState());

  Future<void> getProducts() async {
    try {
      emit(state.copyWith(productLoading: true, productSuccess: false));
      List<ProductInputEntities>? result = await productRepo.getProduct();
      if (result == null) {
        emit(state.copyWith(
            productLoading: false,
            productFailure: true,
            productSuccess: false));
        return;
      }
      emit(state.copyWith(
          productLoading: false,
          productSuccess: true,
          productInputEntities: result));
    } catch (e) {
      emit(state.copyWith(
          productLoading: false, productFailure: true, productSuccess: false));
      print(e);
    }
  }

  Future<void> getBestSellingProducts() async {
    try {
      emit(state.copyWith(productLoading: true, productSuccess: false));
      List<ProductInputEntities>? result = await productRepo.getProduct();
      if (result == null) {
        emit(state.copyWith(
            productLoading: false,
            productFailure: true,
            productSuccess: false));
        return;
      }
      emit(state.copyWith(
          productLoading: false,
          productSuccess: true,
          productInputEntities: result));
    } catch (e) {
      emit(state.copyWith(
          productLoading: false, productFailure: true, productSuccess: false));
      print(e);
    }
  }
}
