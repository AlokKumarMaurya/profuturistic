import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/modules/notification/views/notification_view.dart';
import 'package:profuturistic/app/modules/profile/views/profile_view.dart';

import '../../../views/views/bottom_navigation_bar_view.dart';
import '../../courses/views/courses_view.dart';
import '../controllers/home_controller.dart';
import 'dashboard_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigationBarView(),
        body: PageView(
          controller: controller.homePageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            DashboardView(),
            CoursesView(),
            NotificationView(),
            ProfileView()
          ],
        ));
  }
}
