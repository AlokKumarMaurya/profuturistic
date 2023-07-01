import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profuturistic/app/data/appConstants.dart';
import 'package:profuturistic/app/data/appHelperFunction.dart';

import 'appDimensions.dart';

class AppHelperWidget {
  Widget customIcon(
          {required Widget icon,
          required double padding,
          BoxShape boxShape = BoxShape.circle,
          required Color bgFillColor,
          required double height,
          required double width}) =>
      Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(shape: boxShape, color: bgFillColor),
        child: icon,
      );

  Widget appIcon(
          {double height = 100,
          double width = 200,
          BoxFit boxFit = BoxFit.contain}) =>
      Center(
        child: Image.asset(
          AppConstants.appLogoImage,
          height: height,
          width: width,
          fit: boxFit,
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Text("error in loading image"),
          ),
        ),
      );

  Widget appText(
          {required String text,
          Color color = const Color(0xff0270bd),
          FontWeight fontWeight = FontWeight.bold,
          double fontSize = 20,
          TextOverflow? textOverflow = TextOverflow.ellipsis,
          double wordSpacing = 1,
          double letterSpacing = 1,
            TextAlign textAlign=TextAlign.left,
            int maxLine=1,
          double textHeight = 1}) =>
      Text(
        text,
        textAlign: textAlign,
        maxLines: maxLine,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            overflow: textOverflow,
            wordSpacing: wordSpacing,
            letterSpacing: letterSpacing,
            height: textHeight),
      );

  Widget appButton(
          {Widget leading = const SizedBox(),
          required String text,
          required double buttonWidth,
          required double buttonHeight,
          Color textColor = Colors.white,
          double textSize = 18,
          FontWeight fontWeight = FontWeight.bold,
          double buttonRadius = 20,
          double buttonPadding = 8,
          Color buttonBgColor = const Color(0xff0270bd),
          Color buttonBorderColor = const Color(0xff0270bd),
          double letterSpacing = 1,
          required Function onClick,
          double borderWidth = 1.5}) =>
      InkWell(
        onTap: () => onClick(),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          padding: EdgeInsets.all(buttonPadding),
          decoration: BoxDecoration(
            color: buttonBgColor,
            borderRadius: BorderRadius.circular(buttonRadius),
            border: Border.all(color: buttonBorderColor, width: borderWidth),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading,
              AppDimensions().hSpace10(),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: fontWeight,
                    fontSize: textSize,
                    letterSpacing: letterSpacing),
              )
            ],
          ),
        ),
      );

  Widget appTextField(
          {required TextEditingController controller,
          TextAlign textAlign = TextAlign.start,
          bool isDense = true,
          bool isFilled = false,
          Color filledColor = Colors.transparent,
          double borderRadius = 30,
          required String lableText,
          required String hintText,
          Widget prefix = const SizedBox(),
          Widget suffix = const SizedBox(),
          Color lableTextColor = Colors.blueAccent,
          Color borderColor = Colors.transparent,
          double borderWidth = 2,
          bool isReadOnly = false,
          String errorText = "Enter a valid data",
          int maxChar = 32,
          bool isInputValid = true,
          required Function onChanged,
          bool isObscure = false,
          String obscuringCharacter = "*",
          TextInputType textInputType = TextInputType.text}) =>
      TextFormField(
        onChanged: (val) => onChanged(val),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (input) => isInputValid ? null : errorText,
        keyboardType: textInputType,
        readOnly: isReadOnly,
        inputFormatters: [LengthLimitingTextInputFormatter(maxChar)],
        controller: controller,
        textAlign: textAlign,
        obscureText: isObscure,
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
          isDense: isDense,
          filled: isFilled,
          fillColor: filledColor,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
              gapPadding: 5),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
              gapPadding: 5),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
              gapPadding: 5),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
              gapPadding: 5),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
              gapPadding: 5),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
              gapPadding: 5),
          labelText: lableText,
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: lableTextColor, fontSize: 17),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Theme.of(Get.context!).disabledColor, fontSize: 14),
          /*prefix: prefix,*/
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      );

  PreferredSize appBar({double height=100}) => PreferredSize(
      preferredSize: Size(Get.width, height),
      child: Container(
        width: Get.width,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Theme.of(Get.context!).scaffoldBackgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppDimensions().hSpace10(),
                AppHelperWidget().customIcon(
                    icon: Icon(
                      Icons.book_online,
                      size: 20,
                      color: Theme.of(Get.context!).scaffoldBackgroundColor,
                    ),
                    padding: 5,
                    bgFillColor: Theme.of(Get.context!).primaryColor,
                    height: 35,
                    width: 35),
                AppDimensions().hSpace10(),
                AppHelperWidget().appIcon(width: 80),
              ],
            ),
            IconButton(
                onPressed: () => AppHelperFunction()
                    .showErrorSnackBar(message: "No functionality yet"),
                icon: Icon(
                  Icons.more_vert,
                  size: 35,
                  color: Theme.of(Get.context!).primaryColor,
                ))
          ],
        ),
      ));

  Widget imageBuilder(
          {required String imagePath,
          required bool isAssetImage,
          required double height,
          required double width,
          BoxFit boxFit = BoxFit.fill,
            required double borderRadius,
          BoxShape boxShape = BoxShape.circle}) =>
      isAssetImage
          ? ClipRRect(
             borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                alignment: Alignment.center,
                fit: boxFit,
                imagePath,
                height: height,
                width: width,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: height + 3,
                  width: width + 3,
                  decoration: BoxDecoration(
                      shape: boxShape,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AppConstants.appLogoImage))),
                ),
              ),
            )
          : ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
              child: Image.network(
                fit: boxFit,
                alignment: Alignment.center,
                loadingBuilder: (context, child, loadingProgress) => Center(
                  child: loadingProgress == null
                      ? child
                      : const Center(child: CircularProgressIndicator(),)/*Text(
                          "${(100 * (loadingProgress.cumulativeBytesLoaded / int.parse((loadingProgress.expectedTotalBytes ?? 0).toString()))).toStringAsFixed(2)} %")*/,
                ),
                imagePath,
                height: height,
                width: width,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: height + 3,
                  width: width + 3,
                  decoration: BoxDecoration(
                      shape: boxShape,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/logo.png"))),
                ),
              ),
            );
}
