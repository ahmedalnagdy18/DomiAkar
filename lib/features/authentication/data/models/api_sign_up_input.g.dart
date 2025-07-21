// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_sign_up_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSignUpInput _$ApiSignUpInputFromJson(Map<String, dynamic> json) =>
    ApiSignUpInput(
      email: json['email'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$ApiSignUpInputToJson(ApiSignUpInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'password': instance.password,
    };
