import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/navigator_service.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';

import '../../services/app_storage.dart';

/// Conatins common methods that are being used across the whole app

class GeneralUtils {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        borderRadius: BorderRadius.circular(10),
        backgroundColor: Colors.red,
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.BOTTOM,
        icon: const Icon(
          Icons.error,
          size: 20,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 2),
      )..show(context),
    );
  }

  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        borderRadius: BorderRadius.circular(10),
        backgroundColor: AppColors.primaryColor,
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.BOTTOM,
        icon: const Icon(
          Icons.info,
          size: 20,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  /// when user encounter an error in paypal payment
  /// alet will showup when user quits the webview
  static void showPayemtAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Payment Error",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: AppColors.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            content: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Dear Customer your payment is failed with following message\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        locator<NavigatorService>().pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: const Text(
                        "Try Again",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
    ));
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static bool passwordValidation(String value, BuildContext context) {
    if (value.isEmpty) {
      flushBarErrorMessage("Enter A Password", context);
      return false;
    } else if (value.length <= 6) {
      flushBarErrorMessage("Password is short", context);
      return false;
    } else if (!(value.contains(RegExp(r'[A-Z]')))) {
      flushBarErrorMessage("1+ UPPERCASE required", context);
      return false;
    } else if (!(value.contains(RegExp(r'[0-9]')))) {
      flushBarErrorMessage("1+ Numbers required", context);
      return false;
    } else {
      return true;
    }
  }

  static bool validateEmail(String email, BuildContext context) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty) {
      GeneralUtils.flushBarErrorMessage("Please Enter Your Email", context);
      return false;
    } else if (!emailRegExp.hasMatch(email)) {
      GeneralUtils.flushBarErrorMessage("Please Enter Valid Email", context);
      return false;
    }
    return true;
  }

  static bool validateEmailForm(String email, BuildContext context) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty) {
      return false;
    } else if (!emailRegExp.hasMatch(email)) {
      return false;
    }
    return true;
  }

  static bool validatePassword(String password, BuildContext context) {
    if (password.isEmpty) {
      GeneralUtils.flushBarErrorMessage("Please Enter Password", context);
      return false;
    } else if (password.length < 8) {
      GeneralUtils.flushBarErrorMessage("Please Enter Valid Password", context);
      return false;
    }
    return true;
  }

  /// retuns the difference in days between provided and current date
  static String getDifference(DateTime time) {
    DateTime currDate = DateTime.now();
    if (currDate.difference(time).inHours >= 24) {
      if (currDate.difference(time).inHours >= 24 &&
          currDate.difference(time).inHours <= 48) {
        return 'yesterday';
      }
      return " ${currDate.difference(time).inDays} d ago";
    } else {
      return DateFormat.jm().format(time);
    }
  }

  /// purpose of this method is to set a unique id (locally) for push notification
  static int uniqueIntId() {
    String temp = DateTime.now()
        .toString()
        .replaceAll(' ', '')
        .replaceAll(':', '')
        .replaceAll('-', '')
        .replaceAll('.', '');
    List<String> c = temp.split('');
    c.removeRange(0, 15);
    return int.parse(c.join('').toString());
  }

  static String? validateTextField(String text, String field) {
    if (text.isEmpty) {
      return '$field can\'t be empty';
    }
    return null;
  }
}

class AgoraChatConfig {
  static const String appKey = "411189031#1376485";
  // static const String appKey = "411189031#1376485";
  static String userId = StoragePrefs.getUserSession?.userId ?? '';
  static String agoraToken = StoragePrefs.getRtcAccessTokenFromStorage;
}
