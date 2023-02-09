import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myislamicdream/modules/home/home.dart';
import '../../models/onboarding/onboarding_model.dart';
import '../../utils/constants.dart';


class OnBoardingController extends GetxController{
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();


  forwardAction(){
    box.write('showHome', true);
    isLastPage ? Get.to(Home()) : pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);

  }

  List<onBoarding> onBoardingPages = [
    onBoarding('asset/images/onboarding_one.png', "In Islam", "Dreams are broken into three parts according to the Sunnah:"),
    onBoarding('asset/images/onboarding_two.png', "True or Good Dreams", "True dreams are from Allah, and bad dreams are from Shaitan."),
    onBoarding('asset/images/onboarding_three.png', "Dreams from One's Self", "These dreams come from one's thoughts and are neither from Allah or Shaitan."),

  ];
}