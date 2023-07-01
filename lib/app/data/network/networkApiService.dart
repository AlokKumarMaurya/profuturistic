import 'dart:io';

import 'package:get/get_connect.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';

import 'baseApiService.dart';

class NetworkApiService extends BaseApiService {
  var _header={
    'Content-Type': 'application/json',
    'Cookie': 'ci_session=293e5ab7f9247e0f31a461d1f951824b75a037ba'
  };

  void setHeader({required var header}){
    _header=header;
  }

  @override
  Future getGetApiResponse({required String url}) async {
    AppHelperFunction().appPrint(val: "url >>>>> $url");
    try {
      Response response = await GetConnect().get(url,headers: _header);
      AppHelperFunction().appPrint(val: "status code >>>>> ${response.statusCode}");
      AppHelperFunction().appPrint(val: "body >>>>> ${response.body}");
      return returnResponse(response: response);
    } on SocketException {
      AppHelperFunction().showErrorSnackBar(message: "No internet connection");
      //throw FetchDataException("No internet connection");
    } catch (e) {
      AppHelperFunction().showErrorSnackBar(message: e.toString());
      //throw UnKnownException(e.toString());
    } finally {}
  }

  @override
  Future getPostApiResponse({required String url,required dynamic body}) async {
    AppHelperFunction().appPrint(val: "This is the body $body");
    try {
      Response response =await GetConnect().post(url, body,headers: _header);
      AppHelperFunction().appPrint(val: "This is the response $url ====> ${response.body}");
      return returnResponse(response: response);
    } on SocketException {
      AppHelperFunction().showErrorSnackBar(message: "No internet connection");
      //throw FetchDataException("No internet connection");
    } catch (e) {
      AppHelperFunction().showErrorSnackBar(message: e.toString());
      //throw UnKnownException(e.toString());
    } finally {}
  }

  dynamic returnResponse({required Response response}) async {
    switch (response.statusCode) {
      case 200:
        dynamic res = response.body;
        return res;
      case 400:
        AppHelperFunction().showErrorSnackBar(message: response.body.toString());
        return "null";
        //throw UnAuthorizeException("You are unauthorized ");
      case 500:
        AppHelperFunction().showErrorSnackBar(message: "We are working on server");
        return "null";
        //throw UnKnownException("Internal server error pls try again later");
      default:
        AppHelperFunction().showErrorSnackBar(message: response.body.toString());
        return "null";
        //throw FetchDataException("Some error occurred with status code ${response.statusCode}");
    }
  }
}