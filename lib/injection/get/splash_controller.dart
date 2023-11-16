import 'package:atalup_app/core/animation.dart';
import 'package:atalup_app/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        (Get.context!),
        animationChangingScreen(HomeScreen()),
      );
    });
    super.onInit();
  }
}
