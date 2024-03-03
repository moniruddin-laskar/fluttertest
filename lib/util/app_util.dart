import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/Store/HiveStore.dart';
import 'package:fluttertest/const/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class Apputil {
  static showError() {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
        backgroundColor: red.withOpacity(0.4),
        message: "Server Error",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(bottom: 10, left: 0, right: 0)));
  }

  static storeUserDetails({
    String? accessToken,
    String? hasUserLogged,
    // LoginResponseModel? userDetails,
  }) {
    if (accessToken != null) {
      HiveStore().put(Keys.accessToken, accessToken);
    }
    if (hasUserLogged != null) {
      HiveStore()
          .put(Keys.hasUserLogged, hasUserLogged.toString().toLowerCase());
    }

    // if (userDetails != null) {
    //   HiveStore().put(Keys.userDetails, jsonEncode(userDetails.toJson()));
    // }
  }

  static bool isUserLogged() {
    final accessToken = HiveStore().get(Keys.accessToken);
    print("accessToken: $accessToken");
    return accessToken != null
        ? accessToken != ""
            ? true
            : false
        : false;
  }

  static bool isFilterSet() {
    try {
      var isEnabled = HiveStore().get(Keys.isFilteredEnabled);
      if (isEnabled != null && isEnabled == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static showProgressDialouge() {
    Get.dialog(Center(
      child: Container(
          width: 100,
          height: 100,
          child: Center(
            child: SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                color: Color(0xff2643E5),
              ),
            ),
          )),
    ));
  }

  static closeProgressDialouge() async {
    while ((Get.isDialogOpen ?? false)
        //  ||
        //     Get.previousRoute.toLowerCase().contains('/dialouge')
        ) {
      // printRed(Get.previousRoute);
      Get.back();
    }
  }

  static getActiveColor() {
    return Color(0xff2643E5);
  }

  ///Stores app user profile image using HiveStorage using key -     Keys.profileImage.
  ///It needs to be updated while pushing live build
  static storProfileImage(String? imgUrl) {
    //update it in live version
    HiveStore().put(
        Keys.profileImage,
        imgUrl ??
            "https://dev17.ivantechnology.in/doubtanddiscussion/public/storage/no-image.png");
  }

  // static LoginResponseModel? getUserProfile() {
  //   try {
  //     var data = HiveStore().get(Keys.userDetails);
  //     dev.log(data);
  //     return LoginResponseModel.fromJson(json.decode(data));
  //   } catch (err) {
  //     printRed(err.toString());
  //     return null;
  //   }
  // }

  ///removes necessary key which needs to be deleted while logout
  static logoutStoredKey() async {
    await HiveStore().delete(Keys.accessToken);
    await HiveStore().delete(Keys.userDetails);
    await HiveStore().delete(Keys.userNumber);
    await HiveStore().delete(Keys.userName);
    await HiveStore().delete(Keys.userId);
    await HiveStore().delete(Keys.userEmail);
    await HiveStore().delete(Keys.userCountryCode);
    await HiveStore().delete(Keys.hasUserLogged);
    await HiveStore().delete(Keys.profileImage);
    await HiveStore().delete(Keys.currentUserId);
  }

  static String showOnlyInDebugMode(String message) {
    if (!kReleaseMode) {
      return message;
    }
    return "";
  }

  static Widget showShimmer(
      {double width = 100,
      double height = 25,
      EdgeInsets? padding,
      Color shimmerBaseColor = Colors.black,
      Color shimmerHiglightColor = Colors.grey,
      Color borderColor = Colors.white,
      double borderRadius = 20,
      double borderWidth = 1}) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHiglightColor,
      child: SizedBox(
        width: width + 2,
        height: height + 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: width,
                height: height,
                margin: EdgeInsets.all(.5),
                padding: padding ?? EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: borderColor, width: borderWidth),
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            )
          ],
        ),
      ),
    );
  }

  static String timeStampToDateTime(String timeStamp) {
    try {
      var date =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(timeStamp) * 1000);
      var now = DateTime.now();

      if (DateUtils.isSameDay(date, now)) {
        DateFormat dateFormat = DateFormat().add_jm();
        String returnDT = dateFormat.format(date);
        return returnDT;
      } else {
        DateFormat dateFormat = DateFormat("yMMMd").add_jm();
        String returnDT = dateFormat.format(date);
        return returnDT;
      }
    } catch (err) {
      return "";
    }
  }

  static String strToDateTime(String timeStr) {
    try {
      var date = DateTime.tryParse(timeStr);

      if (date != null) {
        DateFormat dateFormat = DateFormat("dd-MM-yy | ").add_jm();
        String returnDT = dateFormat.format(date);
        return returnDT;
      }
      return "";
    } catch (err) {
      return "";
    }
  }

  static String strToDateTimeV2(String timeStr) {
    try {
      var date = DateTime.tryParse(timeStr);

      if (date != null) {
        DateFormat dateFormat = DateFormat("dd-MM-yy ").add_jm();
        String returnDT = dateFormat.format(date);
        return returnDT;
      }
      return "";
    } catch (err) {
      return "";
    }
  }

  static String timeStampToYearDate(String timeStamp) {
    try {
      var date =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(timeStamp) * 1000);

      DateFormat dateFormat = DateFormat("yMMMd");
      String returnDT = dateFormat.format(date);
      return returnDT;
    } catch (err) {
      return "";
    }
  }

  static String timeStampTotime(String timeStamp) {
    try {
      var date =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(timeStamp) * 1000);

      DateFormat dateFormat = DateFormat().add_jm();
      String returnDT = dateFormat.format(date);
      return returnDT;
    } catch (err) {
      return "";
    }
  }
}
