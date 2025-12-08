import 'package:flutter/material.dart';
import 'package:fruit/core/app_constant/backend_end_point.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/core/models/product_model.dart';
import 'package:fruit/core/repos/product_repo/product_repo.dart';
import 'package:fruit/core/services/data_base.dart';

class ProductRepoImpl extends ProductRepo {
  DataBaseServices dataBaseServices;

  ProductRepoImpl(this.dataBaseServices);

  @override
  Future<List<ProductInputEntities>> getBestSelleingProduct() async {
    try {
      var data = await dataBaseServices.getData(
          path: BackendEndPoint.getProductPath,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true,
          }
          ) as List<Map<String, dynamic>>;
      //* handle it two ways
      //*================================= 1 ==============================
      // List<ProductInputEntities> productModel =
      //     data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      //* or this way
      //*==================================================================
      //*================================= 2 ==============================
      List<ProductModel> productModel =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductInputEntities> productEntities =
          productModel.map((e) => e.toEntity()).toList();
      //*==================================================================

      return productEntities;
    } catch (e) {
      print(e);
      SnackBar(content: Text('An error occurred to get products'));
      return [];
    }
  }

  @override
  Future<List<ProductInputEntities>> getProduct() async {
    try {
      var data = await dataBaseServices.getData(
          path: BackendEndPoint.getProductPath) as List<Map<String, dynamic>>;
      //* handle it two ways
      //*================================= 1 ==============================
      // List<ProductInputEntities> productModel =
      //     data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      //* or this way
      //*==================================================================
      //*================================= 2 ==============================
      List<ProductModel> productModel =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductInputEntities> productEntities =
          productModel.map((e) => e.toEntity()).toList();
      //*==================================================================

      return productEntities;
    } catch (e) {
      print(e);
      SnackBar(content: Text('An error occurred to get products'));
      return [];
    }
  }
}
