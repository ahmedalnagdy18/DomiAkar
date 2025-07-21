part of 'register_cubit.dart';

@immutable
sealed class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SucsessRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  final String message;

  const ErrorRegisterState({required this.message});

  @override
  List<Object> get props => [message];
}
