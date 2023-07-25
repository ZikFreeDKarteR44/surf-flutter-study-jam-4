import 'package:flutter/material.dart';

class BallShadowWidget extends StatelessWidget {
  const BallShadowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 86.0),
      child: Stack(
        children: [
          Image.asset('assets/images/shadow_1.png'),
          Positioned(
            bottom: 8.0,
            left: 70.0,
            right: 70.0,
            child: Image.asset('assets/images/shadow_2.png'),
          ),
        ],
      ),
    );
  }
}
