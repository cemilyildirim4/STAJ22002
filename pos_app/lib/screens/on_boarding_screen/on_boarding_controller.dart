import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CounterController extends GetxController {
  final PageController pageController = PageController();

  var count = 0.obs;
  var nokta = 0.obs;
}

class NoktaAnimasyonu extends StatelessWidget {
  NoktaAnimasyonu({super.key});
  final CounterController controller = Get.put<CounterController>(
    CounterController(),
  );

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: 3,
      effect: ScrollingDotsEffect(
        activeDotColor: Color(0xFF021239),
        dotColor: Colors.grey,
        dotHeight: 10,
        dotWidth: 10,
      ),
    );
  }
}
