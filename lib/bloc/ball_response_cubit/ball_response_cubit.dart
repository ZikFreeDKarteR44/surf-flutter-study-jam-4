import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:surf_practice_magic_ball/api_repositories/data_models/ball_response_model.dart';
import 'package:surf_practice_magic_ball/api_repositories/repository.dart';

part 'ball_response_state.dart';

class BallResponseCubit extends Cubit<BallResponseState> {
  BallResponseCubit() : super(BallResponseInitial());

  void gettingResponseBall() async {
    emit(BallResponseLoading());
    BallResponseModel data = await getResponseBall();
    if (data.error != null) {
      emit(BallResponseError(data));
    } else {
      emit(BallResponseSuccess(data));
    }
  }
}
