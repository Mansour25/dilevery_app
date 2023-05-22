import 'dart:math';import 'package:dilevery_app/controller/home/aceepted_controller.dart';import 'package:dilevery_app/controller/home/home_controller.dart';import 'package:dilevery_app/controller/home/orders_controller.dart';import 'package:dilevery_app/controller/home/settings_controller.dart';import 'package:flutter/material.dart';import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';import 'package:get/get.dart';import 'package:google_fonts/google_fonts.dart';class HomeScreen extends StatelessWidget {  const HomeScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    Get.put(HomeController());    return GetBuilder<HomeController>(builder: (logic) {      return Scaffold(        extendBody: true,        bottomNavigationBar: AnimatedNotchBottomBar(          pageController: logic.pageController,          bottomBarItems: logic.icons,          onTap: (index) {            logic.change_page(index);          },        ),        floatingActionButton: FloatingActionButton(          onPressed: () {            if (logic.current_index == 0) {              Orders_controller controller = Get.find();              controller.get_orders_pending();            }            if (logic.current_index == 1) {              AcceptedController controller = Get.find();              controller.get_orders_accepted();            } if (logic.current_index == 2) {              SettingsController controller = Get.find();              controller.get_archive_orders();            }          },          child: Icon(Icons.refresh),          backgroundColor: Colors.black,        ),        appBar: AppBar(          backgroundColor: Colors.black,          elevation: 0,          title: Text(logic.title_app_bar[logic.current_index],style: GoogleFonts.acme(),),        ),        body: PageView(          controller: logic.pageController,          physics: NeverScrollableScrollPhysics(),          children: List.generate(logic.bottomBarPages.length,              (index) => logic.bottomBarPages[index]),        ),      );    });  }}