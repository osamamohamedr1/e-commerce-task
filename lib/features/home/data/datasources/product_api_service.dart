import 'package:dio/dio.dart';
import 'package:e_commerce_task/features/home/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/core/constants/end_points.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio, {String baseUrl}) = _ProductApiService;

  @GET(kProductsEndPoint)
  Future<ProductsResponse> getProducts();

  @GET('$kProductsEndPoint/{id}')
  Future<ProductModel> getProductById(@Path('id') String productId);
}
