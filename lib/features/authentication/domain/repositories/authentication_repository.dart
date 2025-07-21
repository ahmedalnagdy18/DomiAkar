import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';

abstract class AuthenticationRepository {
  Future<void> register(SignUpInput input);
}
