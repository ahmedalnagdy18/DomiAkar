import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';

class SignUpUsecase {
  AuthenticationRepository repository;
  SignUpUsecase({required this.repository});
  Future<void> call(SignUpInput input) async {
    return repository.register(input);
  }
}
