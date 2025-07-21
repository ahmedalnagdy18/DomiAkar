import 'package:bloc/bloc.dart';
import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';
import 'package:domi_aqar/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignUpUsecase signUpUsecase;
  RegisterCubit({required this.signUpUsecase}) : super(RegisterInitial());

  void registerFuc({
    required SignUpInput input,
  }) async {
    try {
      emit(LoadingRegisterState());

      await signUpUsecase.call(input);
      emit(SucsessRegisterState());
    } catch (e) {
      print(e);
      if (e is FormatException) {
        emit(ErrorRegisterState(message: e.message));
      } else {
        emit(ErrorRegisterState(message: "Error"));
      }
    }
  }
}
