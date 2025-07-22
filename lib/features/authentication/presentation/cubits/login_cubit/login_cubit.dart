import 'package:bloc/bloc.dart';
import 'package:domi_aqar/features/authentication/domain/entity/login_input.dart';
import 'package:domi_aqar/features/authentication/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginCubitInitial());

  void login({required LoginInput loginEntity}) async {
    emit(LoadingLoginState());
    try {
      await loginUsecase.call(loginEntity);
      emit(SucsessLoginState());
    } catch (e) {
      emit(ErrorLoginState(message: e.toString()));
    }
  }
}
