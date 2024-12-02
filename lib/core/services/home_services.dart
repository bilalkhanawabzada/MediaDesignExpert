import 'package:http/http.dart';
import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/network_api_service.dart';

class HomeServices extends BaseService {
  String appId = '5105a7ad9a28463e83b2e8b65c19b6e6';
  String appKey = '411189031 1376485';
  String appName = '1376485';
  String orgName = '411189031';

  Future<Response?> getAllUser() async {
    try {
      final response = await locator<NetworkApiService>()
          .getApiResponseWithToken(
              "https://a41.chat.agora.io/411189031/1376485/users?limit=10",
              null);
      print(response.toString());
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
