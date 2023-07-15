import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/helperWidget/appDimensions.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';
import 'package:profuturistic/app/modules/home/controllers/home_controller.dart';
import 'package:profuturistic/app/routes/app_pages.dart';

import '../../../views/views/profile_tile_view.dart';
import '../../syllabus/syllabusView.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<HomeController>().handleBottomItemTap(index: 0);
        return true;
      },
      child: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController) {
          return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: Size(Get.width, 1),
                    child: const Divider(thickness: 1)),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  onPressed: () =>
                      Get.find<HomeController>().handleBottomItemTap(index: 0),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).disabledColor,
                        radius: 50,
                        child: AppHelperWidget().imageBuilder(
                          borderRadius: 60,
                            boxShape: BoxShape.circle,
                            boxFit: BoxFit.fill,
                            imagePath:
                                "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            isAssetImage: false,
                            height: 100,
                            width: 100),
                      ),
                    ),
                    AppDimensions().vSpace20(),
                    AppHelperWidget().appText(
                        text:profileController.loginResponseModal?.data.name ??"Guest User" ,
                        color: Theme.of(context).canvasColor),
                    AppDimensions().vSpace5(),
                    AppHelperWidget().appText(
                        text: profileController.loginResponseModal?.data.email??"",
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    AppDimensions().vSpace30(),
                    ProfileTileView(
                      title: "Edit Profile",
                      leadingIcon: Icon(
                        Icons.edit,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => AppHelperFunction()
                          .showGoodSnackBar(message: "Tile tap is working fine"),
                    ),
                    ProfileTileView(
                      title: "Course",
                      leadingIcon: Icon(
                        Icons.chrome_reader_mode_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => Get.find<HomeController>().handleBottomItemTap(index: 1),
                    ),
                    ProfileTileView(
                      title: "Syllabus",
                      leadingIcon: Icon(
                        Icons.my_library_books_rounded,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => Get.to(()=>const SyllabusView()),
                    ),
                    ProfileTileView(
                      title: "Live Class",
                      leadingIcon: Icon(
                        Icons.radar,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () =>Get.toNamed(Routes.LiveClassView),
                    ),
                    ProfileTileView(
                      title: "Assignment",
                      leadingIcon: Icon(
                        Icons.assignment,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () =>    Get.toNamed(Routes
                          .ASSIGNMENT),
                    ),
                    ProfileTileView(
                      title: "Library",
                      leadingIcon: Icon(
                        Icons.local_library,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => AppHelperFunction()
                          .showGoodSnackBar(message: "Tile tap is working fine"),
                    ),
                    ProfileTileView(
                      title: "Video Lecture",
                      leadingIcon: Icon(
                        Icons.video_settings_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => Get.toNamed(Routes.VIDEO_LECTURE),
                    ),
                    ProfileTileView(
                      title: "Ask Doubt",
                      leadingIcon: Icon(
                        Icons.lightbulb_outline_sharp,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => Get.toNamed(Routes.ASKDOUBT),
                    ),
                    ProfileTileView(
                      title: "Exam",
                      leadingIcon: Icon(
                        Icons.note_alt_sharp,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => AppHelperFunction()
                          .showGoodSnackBar(message: "Tile tap is working fine"),
                    ),
                    ProfileTileView(
                      title: "Notice",
                      leadingIcon: Icon(
                        Icons.notification_add,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onClick: () => Get.find<HomeController>().handleBottomItemTap(index: 2),
                    ),
                  ],
                ),
              ));
        }
      ),
    );
  }
}
