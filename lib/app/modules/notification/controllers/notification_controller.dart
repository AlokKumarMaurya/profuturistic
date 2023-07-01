import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/appStorage/sharedPrefrences.dart';
import 'package:profuturistic/app/data/network/networkApiService.dart';

import '../../../data/responseModal/notifactionListModal.dart';

class NotificationController extends GetxController {
  bool isLoading=false;
  NotificationListModal? notificationListModal;
  List<Map<String, String>> notificationList = List.generate(
      20,
      (index) => {
            "name": "Name $index",
            "message": "Message of index $index",
            "time": "09:10 min Ago"
          });
  
  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  void getNotification()async{
    isLoading=true;
    update();
    NetworkApiService().getGetApiResponse(url:AppConstants.getNotification+AppPreference().getLoginData().data.uid).then((value){
      isLoading=false;
      update();
      if(value!=null){
        notificationListModal=NotificationListModal.fromJson(value);
        update();
      }
    });
  }

  markAllAsRead() {
    isLoading=true;
    update();
    NetworkApiService().getGetApiResponse(url:AppConstants.markAllAsRead+AppPreference().getLoginData().data.uid).then((value){
      isLoading=false;
      update();
      if(value!=null){
        //notificationListModal=NotificationListModal.fromJson(value);
        getNotification();
        update();
      }
    });
  }
  
  
}
