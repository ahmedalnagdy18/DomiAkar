part of 'login_cubit.dart';

sealed class LoginCubitState extends Equatable {
  const LoginCubitState();

  @override
  List<Object> get props => [];
}

final class LoginCubitInitial extends LoginCubitState {}

class LoadingLoginState extends LoginCubitState {}

class SucsessLoginState extends LoginCubitState {}

class ErrorLoginState extends LoginCubitState {
  final String message;

  const ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
