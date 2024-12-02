import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/services/app_storage.dart';

import '../locator.dart';
import '../network/api_end_point.dart';
import '../network_api_service.dart';

/// User authnetication related Api Calls

class AuthServices extends BaseService {
  Future<http.Response> signUpApiResponse({dynamic data}) async {
    try {
      final response = await locator<NetworkApiService>()
          .getPostApiResponse(ApiEndPoint.signUp, data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  ///**/// This will be sent the Otp to the User ///*///
  Future<http.Response> sendOtp({dynamic data}) async {
    try {
      log(data.toString());
      final response = await locator<NetworkApiService>()
          .getPostApiResponse(ApiEndPoint.sendOtp, data);
      log(response.toString());
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  ///**/// This will be verifyOtp from the User Side ///*///
  Future<http.Response> verifyOtp({dynamic data}) async {
    try {
      print(data.toString());
      final response = await locator<NetworkApiService>()
          .getPostApiResponse(ApiEndPoint.verifyOtp, data);
      print(response.statusCode);
      print("${response.body} data reponse");
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<http.Response> openCreditAccountApiResponse({dynamic data}) async {
  //   try {
  //     final response = await locator<NetworkApiService>()
  //         .getPostApiResponse(ApiEndPoint.openCreditAccount, data);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<http.Response> otpVerificationApiResponse({dynamic data}) async {
    try {
      final response = await locator<NetworkApiService>()
          .getApiResponse(ApiEndPoint.verifyOtp, data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<http.Response> signInApiResponse({dynamic data}) async {
  //   try {
  //     final response = await locator<NetworkApiService>()
  //         .getPostApiResponse(ApiEndPoint.signIn, data);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> forgetPassApiResponse({dynamic data}) async {
  //   try {
  //     final response = await locator<NetworkApiService>()
  //         .getApiResponse(ApiEndPoint.forgetPassword, data);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> resetPasswordApiResponse({dynamic data, token}) async {
  //   try {
  //     final response = await locator<NetworkApiService>()
  //         .getPostApiResponseWithToken(
  //              ApiEndPoint.setNewPassword,  data, token);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> editProfileApiResponse({dynamic data}) async {
  //   try {
  //     final response =
  //         await locator<NetworkApiService>().getPostApiResponseWithToken(
  //        ApiEndPoint.editProfile,
  //        data,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> logoutApiResponse() async {
  //   try {
  //     final response = await locator<NetworkApiService>()
  //         .getApiResponseWithToken( ApiEndPoint.logout,  null);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> deleteAccountApiResponse() async {
  //   try {
  //     final response =
  //         await locator<NetworkApiService>().getApiResponseWithToken(
  //        ApiEndPoint.deleteAccount,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<dynamic> agoraTokenApp(
      {required String uid, required String channelName}) async {
    try {
      // ?channelName=$channelName&uid=$uid
      String url = "${ApiEndPoint.baseUrl}/agora/genrate-agora-app-token";
      print(url);
      // String isLogin = Hive.box('userBox').get('tokenId').toString();
      print("${StoragePrefs.getUserAccessTokenFromStorage} isLogin");
      final response = await locator<NetworkApiService>()
          .getPostAgoraApi(url, StoragePrefs.getUserAccessTokenFromStorage);
      return response;
    } catch (e) {
      log("$e error");
      throw Exception(e);
    }
  }

  Future<dynamic> agoraUserRegister(
      {required String userName, required String password}) async {
    try {
      String url = "https://a41.chat.agora.io/411189031/1376485/users";
      print(url);
      var data = {"username": userName, "password": password};
      String agoraRTC = StoragePrefs.getRtcAccessTokenFromStorage;
      print("$agoraRTC isLogin");
      final response = await locator<NetworkApiService>()
          .getPostApiResponseWithToken(url, data, agoraRTC);

      return response;
    } catch (e) {
      log("$e error");
      throw Exception(e);
    }
  }
}
