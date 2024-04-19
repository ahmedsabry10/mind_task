import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/cubit/home_state.dart';
import 'package:task/features/home/domain/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void emitGetData({
    required String authKey,
    required String userId,
  }) async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getHomeData(
        authKey: authKey,
        userId:userId
        );
    response.when(success: (homeResponse) async {
      emit(HomeState.success(homeResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}
