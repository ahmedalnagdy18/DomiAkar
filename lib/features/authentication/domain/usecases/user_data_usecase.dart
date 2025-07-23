import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';

class UserDataUseCase {
  final AuthenticationRepository repository;

  UserDataUseCase({required this.repository});

  Future<UserDataModel> call() async {
    return await repository.userData();
  }
}
