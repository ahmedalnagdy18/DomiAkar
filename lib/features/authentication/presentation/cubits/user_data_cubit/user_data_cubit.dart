import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_data_state.dart';
import '../../../domain/usecases/user_data_usecase.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserDataUseCase userDataUseCase;

  UserDataCubit({required this.userDataUseCase}) : super(UserDataInitial());

  UserDataModel? get userData =>
      state is SuccessUserData ? (state as SuccessUserData).userData : null;

  Future<void> fetchUserData() async {
    emit(UserDataLoading());
    try {
      final data = await userDataUseCase();
      emit(SuccessUserData(data));
    } catch (e) {
      emit(UserDataError(e.toString()));
    }
  }
}
