part of 'ball_response_cubit.dart';

@immutable
abstract class BallResponseState {}

class BallResponseInitial extends BallResponseState {}

class BallResponseLoading extends BallResponseState {}

class BallResponseSuccess extends BallResponseState {
  BallResponseSuccess(this.ballResponseModel);
  final BallResponseModel ballResponseModel;
}

class BallResponseError extends BallResponseState {
  BallResponseError(this.ballResponseModel);
  final BallResponseModel ballResponseModel;
}

