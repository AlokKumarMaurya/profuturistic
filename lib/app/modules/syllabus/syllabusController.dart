import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/appStorage/sharedPrefrences.dart';
import 'package:profuturistic/app/data/network/networkApiService.dart';

import '../../data/responseModal/syllabusModal.dart';


class SyllabusController extends GetxController{
  SyllabusModal? syllabusModal;
  Map<String, Datum>? testData;
  bool isDataLoading=false;

  @override
  void onInit() {
    getSyllabus();
    super.onInit();
  }

  Future<void> getSyllabus() async {
    isDataLoading=true;
    update();
    try{
      await SyllabusProvider().getSyllabus().then((value) {
        if(value !=null){
          print(value["data"]);
          syllabusModal=SyllabusModal.fromJson((value));
          print(value.runtimeType.toString());
          testData= Map.from(value["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v)));//value["data"];
          print("${testData!["1"]}mmmmmmmmmmmmmmmmmm");
           update();
        }
      });
    }finally{
      isDataLoading=false;
     update();
    }
  }

}






class SyllabusProvider {

  Future getSyllabus() async {
    var res = await NetworkApiService()
        .getGetApiResponse(url: AppConstants.getSyllabus+AppPreference().getLoginData().data.uid);
    if (res != null) {
      return res;
    }
  }
}