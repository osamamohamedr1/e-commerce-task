import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/data/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(ProductInitial());

  final ProductRepository _productRepository;

  Future<void> getProducts() async {
    emit(ProductLoading());

    var result = await _productRepository.getProducts();
    result.fold(
      (failure) {
        emit(ProductFailure(failure.errorMessage));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }

  Future<void> getProductById(String productId) async {
    emit(ProductDetailsLoading());

    var result = await _productRepository.getProductById(productId);
    result.fold(
      (failure) {
        emit(ProductDetailsFailure(failure.errorMessage));
      },
      (product) {
        emit(ProductDetailsSuccess(product));
      },
    );
  }
}
