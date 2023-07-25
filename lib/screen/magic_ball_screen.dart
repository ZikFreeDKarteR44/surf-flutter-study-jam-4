import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/bloc/ball_response_cubit/ball_response_cubit.dart';
import 'package:surf_practice_magic_ball/consts/colors.dart';
import 'package:surf_practice_magic_ball/consts/strings.dart';
import 'package:surf_practice_magic_ball/consts/styles.dart';
import 'package:surf_practice_magic_ball/widgets/ball_shadow_widget.dart';
import 'package:surf_practice_magic_ball/widgets/ball_widget.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BallResponseCubit>(
      create: (context) => BallResponseCubit(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [MainColors.kPurpleColor, MainColors.kPurpleColor, MainColors.kBlackColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 5),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BallWidget(),
                BallShadowWidget(),
                Text(
                  Strings.tapOnBallOrShakePhone,
                  textAlign: TextAlign.center,
                  style: MainStyles.kGreyColorW400,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
