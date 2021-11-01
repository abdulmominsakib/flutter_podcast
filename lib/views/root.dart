import 'package:flutter/material.dart';
import 'pages/01_intro/intro.dart';

/// Mostly Used as a redirector; We can keep our login logic here to keep the
/// main.dart file clean. That's a personal preference;
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroScreens();
  }
}
