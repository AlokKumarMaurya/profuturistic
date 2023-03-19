import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/helperWidget/appHelperWidget.dart';

class ProfileTileView extends GetView {
  Widget leadingIcon;
  String title;
  Function onClick;

  ProfileTileView(
      {Key? key,
      required this.leadingIcon,
      required this.title,
      required this.onClick()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      onTap:()=> onClick(),
      minLeadingWidth: 5,
      leading: AppHelperWidget().customIcon(
          icon: leadingIcon,
          padding: 8,
          bgFillColor: Theme.of(context).primaryColor,
          height: 40,
          width: 40),
      title: Text(title,style: TextStyle(
        color: Theme.of(context).canvasColor,
        fontSize: 18,
        fontWeight: FontWeight.w300
      ),),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 25,
        color: Theme.of(context).disabledColor,
      ),
    );
  }
}
