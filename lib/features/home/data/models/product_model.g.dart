// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String,
  productCode: json['productCode'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  arabicName: json['arabicName'] as String,
  arabicDescription: json['arabicDescription'] as String,
  coverPictureUrl: json['coverPictureUrl'] as String,
  productPictures: json['productPictures'] as String?,
  price: (json['price'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  weight: (json['weight'] as num).toDouble(),
  color: json['color'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  discountPercentage: (json['discountPercentage'] as num).toDouble(),
  sellerId: json['sellerId'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productCode': instance.productCode,
      'name': instance.name,
      'description': instance.description,
      'arabicName': instance.arabicName,
      'arabicDescription': instance.arabicDescription,
      'coverPictureUrl': instance.coverPictureUrl,
      'productPictures': instance.productPictures,
      'price': instance.price,
      'stock': instance.stock,
      'weight': instance.weight,
      'color': instance.color,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'discountPercentage': instance.discountPercentage,
      'sellerId': instance.sellerId,
      'categories': instance.categories,
    };
