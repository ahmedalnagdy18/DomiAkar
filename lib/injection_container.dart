import 'package:domi_aqar/features/authentication/data/repository_imp/authentication_repository_imp.dart';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:domi_aqar/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Usecases
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(repository: sl()));

  // Repository

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp());
}
