import 'dart:io';

import 'package:domi_aqar/features/authentication/domain/entity/login_input.dart';
import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';

abstract class AuthenticationRepository {
  Future<void> register(SignUpInput input);
  Future<void> login(LoginInput input);
  Future<String?> upload(File imageFile);
  Future<UserDataModel> userData();
}
