part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> products;

  ProductSuccess(this.products);
}

final class ProductFailure extends ProductState {
  final String errorMessage;
  ProductFailure(this.errorMessage);
}

final class ProductDetailsLoading extends ProductState {}

final class ProductDetailsSuccess extends ProductState {
  final ProductModel product;

  ProductDetailsSuccess(this.product);
}

final class ProductDetailsFailure extends ProductState {
  final String errorMessage;
  ProductDetailsFailure(this.errorMessage);
}

final class ProductSearchLoading extends ProductState {}

final class ProductSearchSuccess extends ProductState {
  final List<ProductModel> products;

  ProductSearchSuccess(this.products);
}

final class ProductSearchFailure extends ProductState {
  final String errorMessage;
  ProductSearchFailure(this.errorMessage);
}

final class ProductCategoryLoading extends ProductState {}

final class ProductCategorySuccess extends ProductState {
  final List<ProductModel> products;

  ProductCategorySuccess(this.products);
}

final class ProductCategoryFailure extends ProductState {
  final String errorMessage;
  ProductCategoryFailure(this.errorMessage);
}
