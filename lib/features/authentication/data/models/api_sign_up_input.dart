import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_sign_up_input.g.dart';

@JsonSerializable()
class ApiSignUpInput {
  final String email;
  final String username;
  final String phone;
  final String password;

  ApiSignUpInput(
      {required this.email,
      required this.username,
      required this.phone,
      required this.password});

  factory ApiSignUpInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSignUpInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSignUpInputToJson(this);
  factory ApiSignUpInput.fromInput(SignUpInput input) {
    return ApiSignUpInput(
      email: input.email,
      phone: input.phone,
      password: input.password,
      username: input.username,
    );
  }
}
