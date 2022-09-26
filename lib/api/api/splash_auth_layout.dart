import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

import '../../pages/generos_page.dart';
import '../../pages/home_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SplashScreenView(
      navigateRoute: GenerosPages(),
      // backgroundColor: Color(0xffc330d1),
      duration: 4000,
      imageSize: 400,
      imageSrc: "img/splas3.png",
      textType: TextType.NormalText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
