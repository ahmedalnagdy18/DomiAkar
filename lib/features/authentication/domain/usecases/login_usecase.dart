import 'package:domi_aqar/features/authentication/domain/entity/login_input.dart';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';

class LoginUsecase {
  AuthenticationRepository repository;
  LoginUsecase({required this.repository});
  Future<void> call(LoginInput input) async {
    return repository.login(input);
  }
}
