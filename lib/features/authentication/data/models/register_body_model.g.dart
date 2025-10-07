// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyModel _$RegisterBodyModelFromJson(Map<String, dynamic> json) =>
    RegisterBodyModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterBodyModelToJson(RegisterBodyModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
