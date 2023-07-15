import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';
import 'package:profuturistic/app/data/appStorage/sharedPrefrences.dart';
import 'package:profuturistic/app/data/network/networkApiService.dart';

import '../../data/responseModal/zoomDataModal.dart';

class LiveClassController extends GetxController{
  bool isLoading=false;
  ZoomDataModalClass? zoomDataModalClass;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData()async{
    isLoading=true;
    update();
    NetworkApiService().getGetApiResponse(url: "${AppConstants.getZoomData}${AppPreference().getLoginData().data.uid}/${AppPreference().getLoginData().data.batchId}").then((value) {
      isLoading=false;
      update();
      if(value!=null){
        zoomDataModalClass=ZoomDataModalClass.fromJson(value);
      }else{
        AppHelperFunction().showErrorSnackBar(message: "Some error occurred please try again later");
      }
    });
  }

}