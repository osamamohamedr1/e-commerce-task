# E-Commerce Task Flutter App

A modern, scalable Flutter e-commerce application built with Clean Architecture principles, featuring robust state management, efficient networking, and a beautiful user interface.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/
│   ├── constants/       # App constants and endpoints
│   ├── network/         # Network configuration (Dio)
│   ├── utils/           # Utilities and service locator
│   └── widgets/         # Reusable UI components
├── features/
│   ├── authentication/ # Auth feature
│   ├── home/           # Home & Product features
│   ├── cart/           # Shopping cart feature
│   └── favorites/      # Favorites feature
```

## 🎯 State Management

### BLoC Pattern with Cubit

The app uses **Flutter BLoC** for state management, specifically the **Cubit** pattern for simplicity and maintainability.

#### Product Cubit Implementation

```dart
class ProductCubit extends Cubit<ProductState> {
  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await _productRepository.getProducts();
    result.fold(
      (failure) => emit(ProductFailure(failure.errorMessage)),
      (products) => emit(ProductSuccess(products)),
    );
  }
}
```

#### State Management Features

- **Reactive UI**: UI automatically rebuilds when state changes
- **Error Handling**: Dedicated failure states for robust error management
- **Loading States**: Clear loading indicators for better UX
- **Type Safety**: Sealed classes ensure compile-time safety

#### State Classes

```dart
sealed class ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  ProductSuccess(this.products);
}
final class ProductFailure extends ProductState {
  final String errorMessage;
  ProductFailure(this.errorMessage);
}
```

## 🌐 Network Layer

### Dio HTTP Client

The app uses **Dio** as the HTTP client with comprehensive configuration for production-ready networking.


#### Network Features

- **Auto Token Management**: Automatic token injection and refresh
- **Request/Response Logging**: Detailed logging for debugging
- **Timeout Configuration**: Configurable timeouts for reliability
- **Error Handling**: Comprehensive error handling with custom exceptions
- **Interceptors**: Request/response modification capabilities

## 🔄 Retrofit Integration

### Type-Safe API Service

The app uses **Retrofit** for type-safe HTTP API calls with automatic JSON serialization.

#### API Service Definition

```dart
@RestApi(baseUrl: kBaseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio, {String baseUrl}) = _ProductApiService;

  @GET(kProductsEndPoint)
  Future<ProductsResponse> getProducts();

  @GET('$kProductsEndPoint/{id}')
  Future<ProductModel> getProductById(@Path('id') String productId);
}
```

#### Retrofit Features

- **Code Generation**: Automatic implementation generation
- **Type Safety**: Compile-time checking of API calls
- **JSON Serialization**: Automatic JSON to Dart object conversion
- **Path Parameters**: Easy path parameter injection
- **Query Parameters**: Automatic query parameter handling

### Repository Pattern

```dart
class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await _productApiService.getProducts();
      return right(response.items);
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}
```

## 🔧 Dependency Injection

### GetIt Service Locator

The app uses **GetIt** for dependency injection, ensuring loose coupling and testability.

```dart
void setupServiceLocator() {
  getIt.registerSingleton<ProductApiService>(
    ProductApiService(DioClient.create()),
  );
  getIt.registerSingleton<ProductRepositoryImpl>(
    ProductRepositoryImpl(getIt<ProductApiService>()),
  );
}
```

## 📱 Features

### Core Features

- **Product Catalog**: Browse products with images, prices, and ratings
- **Product Details**: Detailed product information with specifications
- **User Authentication**: Secure login/register with token management
- **Shopping Cart**: Add/remove products from cart
- **Favorites**: Save favorite products for later
- **Search & Filter**: Find products quickly
- **Responsive Design**: Adaptive UI for different screen sizes


## 📦 Dependencies


```yaml
dependencies:
  flutter_bloc: ^9.1.1          # State management
  dio: ^5.9.0                   # HTTP client
  retrofit: ^4.7.3              # Type-safe API calls
  get_it: ^8.2.0               # Dependency injection
  dartz: ^0.10.1               # Functional programming
  cached_network_image: ^3.3.1  # Image caching
```


## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── consts.dart           # App constants
│   │   ├── end_points.dart       # API endpoints
│   │   └── spacing.dart          # Spacing constants
│   ├── errors/
│   │   └── failures.dart         # Error handling
│   ├── network/
│   │   └── dio_client.dart       # Dio configuration
│   ├── routing/
│   │   ├── app_router.dart       # Route management
│   │   └── routes.dart           # Route definitions
│   ├── utils/
│   │   ├── cache_helper.dart     # Local storage
│   │   ├── service_locator.dart  # Dependency injection
│   │   └── assets.dart           # Asset management
│   └── widgets/
│       └── app_cached_image.dart # Reusable widgets
├── features/
│   ├── authentication/
│   │   ├── data/
│   │   │   ├── datasources/      # API services
│   │   │   ├── models/           # Data models
│   │   │   └── repositories/     # Repository implementations
│   │   └── presentation/
│   │       ├── bloc/             # State management
│   │       └── views/            # UI screens
│   ├── home/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── bloc/
│   │       └── views/
│   ├── cart/
│   └── favorites/
└── main.dart                     # App entry point
```



## 📸 Screenshots

### 🔐 Authentication Flow

<p align="center">
  <img src="https://github.com/user-attachments/assets/4fb25d04-4b86-49ab-857c-221d10c4456c" width="250" />
  <img src="https://github.com/user-attachments/assets/1db388e0-b55d-445d-84c2-01d0d7669d18" width="250" />
  <img src="https://github.com/user-attachments/assets/4e1ed31b-2d46-40c3-95ce-5dce1f2683fa" width="250" />
</p>

---

### 🏠 Home & 🛍️ Product Details

<p align="center">
  <img src="https://github.com/user-attachments/assets/a4998a1f-23be-442e-b6ea-79a808ad5254" width="250" />
  <img src="https://github.com/user-attachments/assets/63a3e8b6-de58-4084-b469-a864f37d09d2" width="250" />
</p>

---

<p align="center"><i>Built with ❤️ using Flutter</i></p>



