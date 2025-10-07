import 'package:json_annotation/json_annotation.dart';
part 'register_body_model.g.dart';

@JsonSerializable()
class RegisterBodyModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterBodyModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
  factory RegisterBodyModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterBodyModelToJson(this);
}
