import 'dart:io';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';

class UploadUsecase {
  final AuthenticationRepository repository;

  UploadUsecase({required this.repository});

  Future<String?> call(File imageFile) async {
    return repository.upload(imageFile);
  }
}
