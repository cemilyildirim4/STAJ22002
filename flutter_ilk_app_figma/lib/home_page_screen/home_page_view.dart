import 'package:flutter/material.dart';
import 'package:flutter_ilk_app_figma/home_page_screen/home_page_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      tag: UniqueKey().toString(), 
      builder : (controller) =>_HomePageView(controller:controller) ,);
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView({required this.controller,super.key});
  final HomePageController controller;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}