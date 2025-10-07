import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String accessToken;
  final DateTime expiresAtUtc;
  final String refreshToken;

  LoginResponseModel({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
  // factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
  //   return LoginResponseModel(
  //     accessToken: json['accessToken'],
  //     expiresAtUtc: DateTime.parse(json['expiresAtUtc']),
  //     refreshToken: json['refreshToken'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'accessToken': accessToken,
  //     'expiresAtUtc': expiresAtUtc.toIso8601String(),
  //     'refreshToken': refreshToken,
  //   };
  // }
}
