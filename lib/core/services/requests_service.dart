import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/network/api_end_point.dart';
import 'package:jaat_app/core/network_api_service.dart';
import 'package:jaat_app/core/services/app_storage.dart';

class RequestsService extends BaseService {
  RequestsService();

  // final String tokens = StorageKeys.userSessionAccessToken;
    final token = StoragePrefs.getUserAccessTokenFromStorage;

  Future<http.Response> getPendingRequestsApi() async {
    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.getPendingRequests, null, token: token);
      inspect(response);
      return response;
    } catch (e) {
      inspect(e);
      throw Exception(e);
    }
  }

  Future<http.Response> acceptConnectionRequest(String id) async {
    final token = StoragePrefs.getUserAccessTokenFromStorage;
    log(token);
    Map<String, dynamic> data = {
      'requestId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.acceptRequest, data, token);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> rejectConnectionRequest(String id) async {
    final token = StoragePrefs.getUserAccessTokenFromStorage;
    Map<String, dynamic> data = {
      'requestId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.acceptRequest, data, token);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<http.Response> undoConnectionReqApi(String id) async {
  //   Map<String, dynamic> data = {
  //     'receiverId': id,
  //   };
  //   try {
  //     final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.undoConnectionReq, data, token);
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
