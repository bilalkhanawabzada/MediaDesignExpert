import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'base/base_service.dart';
import 'network/base_api.dart';
import 'network/exception.dart';

/// A very dynamic class for APIs server calls

class NetworkApiService extends BaseService implements BaseApiService {
  /// each api calls goes from [returnResponse] as it decides which exception should throw
dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 403:
        return response;
      case 400:
        return response;
      case 404:
        return response;
      default:
        FetchDataException('Error while Communication with status code${response.statusCode}');
    }
  }

  /// Simple GET method API call
  @override
  Future getApiResponse(String url, dynamic data) async {
    String queryString = '';
    String requestUrl = '';
    if (data == null) {
      requestUrl = url;
    } else {
      queryString = Uri(queryParameters: data).query;
      requestUrl = '$url?$queryString';
    }
    final headers = {"Accept": "application/json"};
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(requestUrl), headers: headers).timeout(
            const Duration(
              seconds: 20,
            ),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  /// A GET method api call with bearer token Authorization
  @override
  Future<dynamic> getApiResponseWithToken(String? url, var data, {String? token}) async {
    String queryString = '';
    String requestUrl = '';
    if (data == null) {
      requestUrl = url!;
    } else {
      queryString = Uri(queryParameters: data).query;
      requestUrl = '$url?$queryString';
    }
    final headers = {'Authorization': 'Bearer $token', "Accept": "application/json"};
    log("URL: $requestUrl");
    log("headers: ${headers.toString()}");
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(requestUrl), headers: headers).timeout(
            const Duration(
              seconds: 40,
            ),
          );

      log("API RESPONSE: ${response.body.toString()}");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  /// Simple POST method Api call
  @override
  Future<http.Response> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      if (kDebugMode) {
        print(url);
      }
      if (kDebugMode) {
        print(data.toString());
      }
      final response = await http.post(Uri.parse(url), body: json.encode(data), headers: headers).timeout(const Duration(seconds: 30));
      if (kDebugMode) {
        print(response);
      }
      inspect(responseJson);
      return responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }
    return responseJson;
  }

  /// POST method Api call with bearer token Authorization
  @override
  Future<dynamic> getPostApiResponseWithToken(String url, data, String? token) async {
    // ignore: unused_local_variable
    dynamic responseJson;
    try {
      if (token == null) {
        final headers = {
          HttpHeaders.contentTypeHeader: 'application/json',
        };
        final response = await http.post(Uri.parse(url), body: json.encode(data), headers: headers).timeout(const Duration(
              seconds: 20,
            ));
        return responseJson = returnResponse(response);
      } else {
        final headers = {
          HttpHeaders.contentTypeHeader: 'application/json',
          'Authorization': 'Bearer $token',
        };
        if (kDebugMode) {
          print(headers.toString());
        }
        log(headers.toString());
        log(url.toString());
        log(json.encode(data));
        final response = await http.post(Uri.parse(url), body: json.encode(data), headers: headers).timeout(const Duration(
              seconds: 20,
            ));

        inspect(response);
        if (kDebugMode) {
          print("$response network class response");
        }
        return responseJson = returnResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }
  }

  /// POST method api call with bearer token Authorization and a [MultipartFile]
  @override
  Future getPostApiResponseWithTokenAndFile(String url, File file) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token')!;
    dynamic responseJson;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll(headers);
      request.files.add(http.MultipartFile.fromBytes("file", File(file.path).readAsBytesSync(), filename: file.path));
      var res = await request.send();
      if (res.statusCode == 200) {
        final resp = await http.Response.fromStream(res);
        return responseJson = returnResponse(resp);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }

    return responseJson;
  }

  Future<dynamic> getPostAgoraApi(String url, String token) async {
    try {
      dynamic responseJson;
      final headerMap = {"Content-Type": "application/json", "Accept": "application/json", "Authorization": 'Bearer $token'};
      log(token);

      log(url.toString());
      final response = await http
          .post(
            Uri.parse(url),
            headers: headerMap,
          )
          .timeout(const Duration(seconds: 20));
      var data = jsonDecode(response.body);
      log("$data response");
      return responseJson = data;
    } on SocketException {
      log('message');
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }
  }


  /// A GET method api call with bearer token Authorization
  @override
  Future<dynamic> getApiDeleteWithToken(String? url, var data, {String? token}) async {
    String queryString = '';
    String requestUrl = '';
    if (data == null) {
      requestUrl = url!;
    } else {
      queryString = Uri(queryParameters: data).query;
      requestUrl = '$url?$queryString';
    }
    final headers = {'Authorization': 'Bearer $token', "Accept": "application/json"};
    log("URL: $requestUrl");
    log("headers: ${headers.toString()}");
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(requestUrl), headers: headers).timeout(
            const Duration(
              seconds: 40,
            ),
          );

      log("API RESPONSE: ${response.body.toString()}");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



}
