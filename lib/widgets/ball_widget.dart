import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:surf_practice_magic_ball/api_repositories/data_models/ball_response_model.dart';
import 'package:surf_practice_magic_ball/bloc/ball_response_cubit/ball_response_cubit.dart';
import 'package:surf_practice_magic_ball/consts/styles.dart';
import 'package:shake/shake.dart';

class BallWidget extends StatefulWidget {
  const BallWidget({Key? key}) : super(key: key);

  @override
  State<BallWidget> createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> with TickerProviderStateMixin {
  late AnimationController _animationBallController;

  @override
  void initState() {
    super.initState();
    _animationBallController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (_animationBallController.isCompleted) {
          _animationBallController.repeat();
        }
      });

    if (SizerUtil.deviceType == DeviceType.mobile) {
      ShakeDetector detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          BlocProvider.of<BallResponseCubit>(context).gettingResponseBall();
        },
        minimumShakeCount: 1,
        shakeSlopTimeMS: 500,
        shakeCountResetTime: 3000,
        shakeThresholdGravity: 1.4,
      );
      detector.startListening();
    }
  }

  @override
  void dispose() {
    _animationBallController.dispose();
    super.dispose();
  }

  double _shake(double value) => 2 * (0.5 - (0.5 - Curves.linear.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallResponseCubit, BallResponseState>(
      builder: (context, state) {

        BallResponseModel? data;
        if (state is BallResponseSuccess) {
          data = state.ballResponseModel;
        } else if (state is BallResponseError) {
          data = state.ballResponseModel;
        }

        return AnimatedBuilder(
          animation: _animationBallController,
          builder: (context, child) => Transform.translate(
            offset: Offset(0, 20 * _shake(_animationBallController.value)),
            child: child,
          ),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<BallResponseCubit>(context).gettingResponseBall();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                state is !BallResponseError ? Image.asset('assets/images/ball.png') : const SizedBox(),
                state is BallResponseError ? Image.asset('assets/images/red_ball.png') : const SizedBox(),
                Positioned(
                  top: 56.0,
                  bottom: 56.0,
                  left: 56.0,
                  right: 56.0,
                  child: Image.asset('assets/images/small_star.png'),
                ),
                Positioned(
                  top: 84.0,
                  bottom: 84.0,
                  left: 84.0,
                  right: 84.0,
                  child: Image.asset('assets/images/star.png'),
                ),

                state is BallResponseLoading ? FadeIn(
                  child: Positioned(
                    top: 40.0,
                    bottom: 40.0,
                    left: 40.0,
                    right: 40.0,
                    child: Image.asset('assets/images/shadow_in_ball.png'),
                  ),
                ) : const SizedBox(),

                state is BallResponseSuccess || state is BallResponseError ? FadeIn(
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Text(
                      data?.reading ?? data?.error ?? '',
                      textAlign: TextAlign.center,
                      style: MainStyles.kWhiteColorW400,
                    ),
                  ),
                ) : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
