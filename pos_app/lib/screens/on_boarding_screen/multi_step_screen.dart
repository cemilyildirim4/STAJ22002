import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/screens/on_boarding_screen/on_boarding_controller.dart';

class Builderscreen extends StatelessWidget {
  const Builderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());
    return MultiStepScreen(controller: controller);
  }
}

class MultiStepScreen extends StatelessWidget {
  MultiStepScreen({required this.controller, super.key});
  final CounterController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 193),
              child: SizedBox(height: 291, width: 361, child: gecisSayfasi()),
            ),

            Container(
              margin: EdgeInsets.only(top: 113, left: 135, right: 145),
              child: NoktaAnimasyonu(),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  if (controller.count.value < 2) {
                    int nextPage = controller.count.value + 1;
                    controller.pageController.animateToPage(
                      nextPage,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                    controller.count.value = nextPage;
                    print(
                      "next page : ${nextPage} \n controller.count.value : ${controller.count.value}",
                    );
                    controller.pageController.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    controller.count.value = 0;
                    context.pushNamed("login_screen");
                    controller.pageController.jumpToPage(
                      controller.count.value,
                    );
                  }
                },
                child: Image.asset("assets/images/button_continue.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageView gecisSayfasi() {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Image.asset(
            "assets/images/step_${controller.count.value + 1}.png",
            fit: BoxFit.cover,
          ),
        );
      },
      controller: controller.pageController,
    );
  }
}
