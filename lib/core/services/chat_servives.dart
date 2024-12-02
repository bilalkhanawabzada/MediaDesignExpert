import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/network_api_service.dart';

class ChatService extends BaseService {
  Future<dynamic> getCurrentUser({required String userName}) async {
    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(
          "https://a41.chat.agora.io/411189031/1376485/users/?username=$userName",
          null);
      // print(response.toString());

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> getUserStatus({required String userName}) async {
    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(
          "https://a41.chat.agora.io/411189031/1376485/users/$userName/status",
          null);
      // print(response.toString());

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
