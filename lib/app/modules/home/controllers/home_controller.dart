import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController _homePageController = PageController(initialPage: 0);
  final PageController _bannerPageController = PageController(initialPage: 0);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  int _selectedTab = 0;

  PageController get homePageController => _homePageController;

  PageController get bannerPageController => _bannerPageController;

  TextEditingController get searchTextEditingController =>
      _searchTextEditingController;

  int get selectedTab => _selectedTab;
  List<String> tabList = ["All", "Olympiad", "Banking", "Current - Affairs"];

  void handleBottomItemTap({required int index}) {
    _homePageController
        .animateToPage(index,
            duration: const Duration(microseconds: 1),
            curve: Curves.bounceInOut)
        .then((value) => update());
  }

  void handleBannerScroll(int index) {
    _bannerPageController
        .animateToPage(index,
            duration: const Duration(microseconds: 2), curve: Curves.bounceIn)
        .then((value) => update());
  }

  void handleTabListTap({required int index}) {
    _selectedTab = index;
    update();
  }

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1)).then((value) => update());
    startBannerScroll();
    // TODO: implement onInit
    super.onInit();
  }

  void startBannerScroll() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      int currentPage = _bannerPageController.page!.toInt();
      if (currentPage == 4) {
        currentPage = -1;
      }
      _bannerPageController
          .animateToPage(++currentPage,
              duration: const Duration(microseconds: 2), curve: Curves.bounceIn)
          .then((value) => update());
    });
  }
}
