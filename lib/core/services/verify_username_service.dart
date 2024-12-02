import 'package:http/http.dart' as http;
import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/locator.dart';

import '../network/api_end_point.dart';
import '../network_api_service.dart';

class VerifyUserName extends BaseService {
  VerifyUserName();
  Future<http.Response> checkUsernameResponse(String userName) async {
    try {
      Map<String,dynamic> query={'userName': userName};
      final response = await locator<NetworkApiService>()
          . getApiResponse(ApiEndPoint.checkUserNameUrl, query);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}