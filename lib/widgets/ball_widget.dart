import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/consts/styles.dart';

class BallWidget extends StatefulWidget {
  const BallWidget({Key? key}) : super(key: key);

  @override
  State<BallWidget> createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> with TickerProviderStateMixin {

  late AnimationController animationBallController;

  @override
  void initState() {
    super.initState();
    animationBallController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward()
      ..addListener(() {
        if (animationBallController.isCompleted) {
          animationBallController.repeat();
        }
      });
  }

  @override
  void dispose() {
    animationBallController.dispose();
    super.dispose();
  }

  double shake(double value) => 2 * (0.5 - (0.5 - Curves.linear.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationBallController,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, 20 * shake(animationBallController.value)),
          child: child,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/ball.png'),
            // Image.asset('assets/images/red_ball.png'),
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

            // Positioned(
            //   top: 40.0,
            //   bottom: 40.0,
            //   left: 40.0,
            //   right: 40.0,
            //   child: Image.asset('assets/images/shadow_in_ball.png'),
            // ),

            const Padding(
              padding: EdgeInsets.all(80.0),
              child: Text(
                'Весьма сомнительно',
                textAlign: TextAlign.center,
                style: MainStyles.kWhiteColorW400,
              ),
            ),
          ],
        ),
      );
  }
}
