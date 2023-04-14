import 'dart:convert';

import 'package:profuturistic/app/data/appConstants.dart';

import '../../../data/network/networkApiService.dart';

class AuthProvider {

  Future signUp({required Map body}) async {
    var res = await NetworkApiService()
        .getPostApiResponse(url: AppConstants.signUp, body: jsonEncode(body));
    if (res != null) {
      return res;
    }
  }


  Future login({required Map body}) async {
    var res = await NetworkApiService()
        .getPostApiResponse(url: AppConstants.login, body: jsonEncode(body));
    if (res != null) {
      return res;
    }
  }

}
