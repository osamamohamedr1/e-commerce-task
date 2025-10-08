import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/core/utils/errors.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/data/datasources/product_api_service.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductById(String productId);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl(this._productApiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await _productApiService.getProducts();

      return right(response.items);
    } catch (e) {
      log(e.toString());
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String productId) async {
    try {
      final product = await _productApiService.getProductById(productId);
      return right(product);
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}
