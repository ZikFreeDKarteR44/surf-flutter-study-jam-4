import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/bloc/ball_response_cubit/ball_response_cubit.dart';

class BallShadowWidget extends StatelessWidget {
  const BallShadowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallResponseCubit, BallResponseState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 86.0),
          child: Stack(
            children: [
              Image.asset('assets/images/${state is BallResponseError ? 'shadow_red_1' : 'shadow_1'}.png'),
              Positioned(
                bottom: 8.0,
                left: 70.0,
                right: 70.0,
                child: Image.asset('assets/images/${state is BallResponseError ? 'shadow_red_2' : 'shadow_2'}.png'),
              ),
            ],
          ),
        );
      },
    );
  }
}
