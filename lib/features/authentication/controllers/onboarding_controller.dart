import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job2main/features/authentication/screens/onboarding/branching.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;
  final int pageCount; // Declare pageCount

  OnBoardingController({required this.pageCount});

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value < pageCount - 1) {
      int nextPage = currentPageIndex.value + 1;
      pageController.jumpToPage(nextPage);
    } else {
      Get.offAll(const BranchingScreen());
    }
  }

  void skipPage() {
    currentPageIndex.value = pageCount - 1;
    pageController.jumpToPage(pageCount - 1);
  }
}
