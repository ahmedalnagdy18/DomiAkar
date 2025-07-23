part of 'upload_cubit.dart';

sealed class UploadState extends Equatable {
  const UploadState();

  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

class LoadingUpload extends UploadState {}

class SuccessUpload extends UploadState {
  final String imageUrl;

  const SuccessUpload(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class ErrorUpload extends UploadState {
  final String message;

  const ErrorUpload(this.message);

  @override
  List<Object> get props => [message];
}
