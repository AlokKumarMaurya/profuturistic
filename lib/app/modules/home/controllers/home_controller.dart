import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/network/networkApiService.dart';

import '../../../data/responseModal/bannerModal.dart';
import '../../../data/responseModal/homeScreenModlas/allCoursesForTabModal.dart';
import '../providers/homeProvider.dart';

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
RxBool isDataLoading=false.obs;

  AllTabCourseCourseModal? allTabCourseCourseModal;
  AllTabCourseCourseModal? searchAllTabCourseCourseModal;
  AllTabCourseCourseModal? courseTabList;
  BannerModal? bannerModal;
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

  void handleTabListTap({required int index,required String courseId}) async{
    print("9o8890jklsjksjdnfkjds");
    _selectedTab = index;
    getCourseById(courseId: courseId);
    update();
  }

  @override
  void onInit() {
    getBanner();
    getTabCourseList();
    getBanner();
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


  getAllTabCourse()async{
try{
  await HomeApiProvider().getAllTabCourseList().then((value){
    if(value !=null){
      allTabCourseCourseModal=AllTabCourseCourseModal.fromJson(value);
      allTabCourseCourseModal!.batches=allTabCourseCourseModal!.batches.where((element) {
        return element.catId==courseTabList!
            .batches[_selectedTab].catId;}).toList();
      searchAllTabCourseCourseModal=AllTabCourseCourseModal.fromJson(value);
      update();
    }else{
      allTabCourseCourseModal=AllTabCourseCourseModal(status: true, batches: []);
      searchAllTabCourseCourseModal=AllTabCourseCourseModal(status: true, batches: []);
    }
  } );
}catch(e){
  allTabCourseCourseModal=AllTabCourseCourseModal(status: true, batches: []);
  searchAllTabCourseCourseModal=AllTabCourseCourseModal(status: true, batches: []);
}
  }


  getTabCourseList()async{
try{
  await HomeApiProvider().getCourseTabList().then((value){
    if(value !=null){
      courseTabList=AllTabCourseCourseModal.fromJson(value);
      getAllTabCourse();
      update();
    }else{
      courseTabList=AllTabCourseCourseModal(status: true, batches: []);
    }
  } );
}catch(e){
  courseTabList=AllTabCourseCourseModal(status: true, batches: []);
}
  }

void getCourseById({required String courseId})async{
  allTabCourseCourseModal=null;
  try{
    await HomeApiProvider().getCourseById(courseId: courseId).then((value){
      if(value !=null){
        allTabCourseCourseModal=AllTabCourseCourseModal.fromJson(value);
        getAllTabCourse();
        update();
      }
    } );
  }catch(e){
    allTabCourseCourseModal=AllTabCourseCourseModal(status: true, batches: []);
  }
}

  void getBanner() {
    isDataLoading.value=true;
    bannerModal=null;
    update();
    NetworkApiService().getGetApiResponse(url: AppConstants.getBanner).then((value){
      isDataLoading.value=false;
      update();
      if(value !=null){
        bannerModal=BannerModal.fromJson(value);
        update();
      }
    });
  }

searchCourseTabList({ required String searchText}){
  allTabCourseCourseModal!.batches=allTabCourseCourseModal!.batches.where((element) {
    return element.batchName.toLowerCase().contains(searchText.toLowerCase());
  }).toList();
  update();
  if(searchText==""){
    allTabCourseCourseModal=searchAllTabCourseCourseModal;
    update();
  }
}


}
