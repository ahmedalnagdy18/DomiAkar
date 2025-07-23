import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:domi_aqar/features/authentication/domain/usecases/upload_usecase.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UploadUsecase uploadUsecase;

  UploadCubit({required this.uploadUsecase}) : super(UploadInitial());

  Future<void> uploadImage(File imageFile) async {
    emit(LoadingUpload());
    try {
      final imageUrl = await uploadUsecase.call(imageFile);
      if (imageUrl != null) {
        emit(SuccessUpload(imageUrl));
      } else {
        emit(ErrorUpload("Failed to upload image."));
      }
    } catch (e) {
      emit(ErrorUpload(e.toString()));
    }
  }
}
