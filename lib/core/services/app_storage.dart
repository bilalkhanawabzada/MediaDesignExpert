import 'package:flutter/material.dart';

import '/plugins/nb_utils/nb_utils.dart' as utl;
import '../models/verify_otp_model.dart';

class StorageKeys {
  static const String isUserLoggedIn = "IsUserLoggedIn";
  static const String userSessionData = "UserSessionData";
  static const String userSessionAccessToken = "UserSessionAccessToken";
  static const String rtcAccessToken = "rtcAccessToken";
  static const String userProfileData = "UserProfileData";
  static const String userProfilePic = "UserProfilePic";
}

class StoragePrefs {
  /// Initialize sharedPreferences when accessed for the first time
  // static Future<void> initSharedPreferences() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }
  ///
  // /// Firebase Device Token
  // static Future setFirebaseTokenInSP(String _fireToken) async {
  //   await utl.setValue(StorageKeys.firebaseToken, _fireToken);
  //   // getFirebaseTokenFromSP();
  // }
  //
  // static String? getFirebaseTokenFromSP() {
  //   try {
  //     String fbToken = utl.getStringAsync(StorageKeys.firebaseToken);
  //     debugPrint(fbToken);
  //     return fbToken;
  //   } catch (_e) {
  //     // debugPrint('Error: SharedPrefs -> getFirebaseTokenFromSP => $_e');
  //     return null;
  //   }
  // }

  /// User Login
  static Future<void> setUserSession(String loggedUserRes) async {
    await utl.setValue(StorageKeys.isUserLoggedIn, true);
    await utl.setValue(
      StorageKeys.userSessionData,
      loggedUserRes,
    );
  }

  /// set user access token here
  static Future<void> setUserLogin(bool userLogin) async {
    await utl.setValue(StorageKeys.isUserLoggedIn, userLogin);
  }

  static bool get getIsUserLoggedIn {
    try {
      return utl.getBoolAsync(StorageKeys.isUserLoggedIn);
    } catch (_e) {
      debugPrint('Error: SharedPrefs -> getIsUserLoggedIn => $_e');
      return false;
    }
  }

  static VerifyOtpModel? get getUserSession {
    try {
      String data = utl.getStringAsync(StorageKeys.userSessionData);
      if (data.isNotEmpty) {
        return verifyOtpModelFromJson(data);
      }
      return null;
    } catch (_e) {
      debugPrint('Error: SharedPrefs -> getUserSession => $_e');
      return null;
    }
  }

  // Get method from User Access Token from storage
  static String get getUserAccessTokenFromStorage {
    try {
      return utl.getStringAsync(StorageKeys.userSessionAccessToken);
    } catch (_e) {
      debugPrint('Error: SharedPrefs -> getUserAccessTokenFromStorage => $_e');
      return '';
    }
  }

  /// set user access token here
  static Future<void> setUserSessionAccessTokenInStorage(
      String accessToken) async {
    await utl.setValue(StorageKeys.userSessionAccessToken, accessToken);
  }

  /// store rtc token for chat
  static String get getRtcAccessTokenFromStorage {
    try {
      return utl.getStringAsync(StorageKeys.rtcAccessToken);
    } catch (_e) {
      debugPrint('Error: SharedPrefs -> rtcAccessToken => $_e');
      return '';
    }
  }

  static Future<void> setRtcAccessTokenInStorage(String accessToken) async {
    await utl.setValue(StorageKeys.rtcAccessToken, accessToken);
  }

  /// set user profile data
  static Future<void> setUserProfileData(String UserProfileRes) async {
    await utl.setValue(StorageKeys.userProfileData, UserProfileRes);
  }

  ///clear data in case of logout
  static Future<void> logoutSession() async {
    await utl.clearSharedPref();
    // await utl.removeKey(StorageKeys.userProfileData);
    // await utl.removeKey(StorageKeys.userSessionData);
    // await utl.removeKey(StorageKeys.isUserLoggedIn);
  }

  /// User Profile
  static Future<void> setUserProfile(String profileRes) async {
    await utl.setValue(StorageKeys.userProfileData, profileRes);
  }
  //
  // static UserProfileModel? get getUserProfileData {
  //   try {
  //     String? userProfData = utl.getStringAsync(StorageKeys.userProfileData);
  //     if (userProfData.isEmptyOrNull) return null;
  //
  //     return UserProfileModel.fromJson(jsonDecode(userProfData));
  //     return null;
  //   } catch (_e) {
  //     debugPrint('Error: SharedPrefs -> getUserProfile => $_e');
  //     return null;
  //   }
  // }

  /// Application Settings
  // static Future<void> setAppSetting(String appSettingRes) async {
  //   await utl.setValue(StorageKeys.appSetting, appSettingRes);
  // }
  //
  // static AppSettingsModel? getAppSetting() {
  //   try {
  //     String? appSettingData = utl.getStringAsync(StorageKeys.appSetting);
  //     if (appSettingData.isEmptyOrNull) return null;
  //
  //     return appSettingsModelFromJson(appSettingData);
  //   } catch (_e) {
  //     // debugPrint('Error: SharedPrefs -> getUserProfile => $_e');
  //     return null;
  //   }
  // }
}
