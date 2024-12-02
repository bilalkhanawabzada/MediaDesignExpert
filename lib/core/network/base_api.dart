import 'dart:io';
import 'package:jaat_app/core/network_api_service.dart';

/// An abstract class for [NetworkApiService]

abstract class BaseApiService {
  Future<dynamic> getApiResponse(String url, dynamic data);
  Future<dynamic> getApiResponseWithToken(String url, dynamic data);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPostApiResponseWithToken(String url, dynamic data, String? token);
  Future<dynamic> getPostApiResponseWithTokenAndFile(String url, File file);
}
