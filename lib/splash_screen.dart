import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myislamicdream/modules/home/home.dart';
import 'package:myislamicdream/modules/home/home_controller.dart';

import 'modules/on_boarding/on_boarding.dart';

class SplashScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0A284C),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xff0A284C),
            child: AnimatedSplashScreen(
              backgroundColor: Color(0xff0A284C),
              duration: 3000,
              splashIconSize: 80,
              splash: Image.asset('asset/images/myislamicdream_logo.png', height: 95, width: 353,),
              nextScreen: Home(),
              splashTransition: SplashTransition.slideTransition,
            ),
          ),
        )
    );
  }
}
