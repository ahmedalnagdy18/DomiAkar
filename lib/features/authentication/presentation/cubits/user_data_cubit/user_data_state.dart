import 'package:equatable/equatable.dart';
import '../../../domain/entity/model/user_data_model.dart';

abstract class UserDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class SuccessUserData extends UserDataState {
  final UserDataModel userData;

  SuccessUserData(this.userData);

  @override
  List<Object?> get props => [userData];
}

class UserDataError extends UserDataState {
  final String message;

  UserDataError(this.message);

  @override
  List<Object?> get props => [message];
}
