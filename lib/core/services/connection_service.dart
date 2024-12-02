import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/network/api_end_point.dart';
import 'package:jaat_app/core/network_api_service.dart';
import 'package:jaat_app/core/services/app_storage.dart';

class ConnectionService extends BaseService {
  ConnectionService();

  // final String tokens = StorageKeys.userSessionAccessToken;
    final token = StoragePrefs.getUserAccessTokenFromStorage;

  Future<http.Response> getConnectionsApi() async {
    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.getConnections, null, token: token);
      inspect(response);
      return response;
    } catch (e) {
      inspect(e);
      throw Exception(e);
    }
  }



}
