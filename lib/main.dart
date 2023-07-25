import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  doWhenWindowReady(() {
    var initialSize = const Size(500, 700);
    appWindow.minSize = initialSize;
    appWindow.title = "Surf Magic Ball";
  });
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MagicBallScreen(),
        );
      },
    );
  }
}
