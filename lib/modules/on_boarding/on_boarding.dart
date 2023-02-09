import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'onboarding_controller.dart';


class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  final OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_primary,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: onBoardingController.pageController,
              onPageChanged: onBoardingController.selectedPageIndex,
              itemCount: onBoardingController.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  color: color_primary,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(onBoardingController
                          .onBoardingPages[index].imageAsset, height: 300, width: 300,),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        onBoardingController.onBoardingPages[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24, color: color_secondary, fontFamily: 'Roboto'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          onBoardingController.onBoardingPages[index].desc,
                          style: TextStyle(fontSize: 18, color: Color(0xffBFBFBF), fontFamily: 'Roboto'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 25,
              left: 25,
              child: Row(
                children: List.generate(
                  onBoardingController.onBoardingPages.length,
                      (index) => Obx(() {
                    return Container(
                      margin: EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: onBoardingController.selectedPageIndex.value ==
                              index
                              ? color_secondary
                              : Colors.grey,
                          shape: BoxShape.circle),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Obx(() {
                return FloatingActionButton(
                  backgroundColor: color_secondary,
                  elevation: 15,
                  onPressed: onBoardingController.forwardAction,
                  child: Text(onBoardingController.isLastPage ? "Start" : "Next"),
                );
              }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
