import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jaat_app/core/base/base_service.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/network/api_end_point.dart';
import 'package:jaat_app/core/network_api_service.dart';
import 'package:jaat_app/core/services/app_storage.dart';

class GetAllProfilesService extends BaseService {
  GetAllProfilesService();

  Future<http.Response> getAllProfilesApi() async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
  //  var tokenN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YzQ0OTIxYjc4ODA4MDJmZjBlZWExNSIsImlhdCI6MTcyNDEzOTg1OCwiZXhwIjoxNzI1MDAzODU4fQ.oQLLDl5PYw3MdoeZXdGOwdcsat3oo6sfhYjW_4f1keE';

    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.getAllProfiles, null, token: tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

    Future<http.Response> searchProfilesApi(String query) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
  //  var tokenN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YzQ0OTIxYjc4ODA4MDJmZjBlZWExNSIsImlhdCI6MTcyNDEzOTg1OCwiZXhwIjoxNzI1MDAzODU4fQ.oQLLDl5PYw3MdoeZXdGOwdcsat3oo6sfhYjW_4f1keE';

    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.searchQuery+query, null, token: tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> sendConnectionReqApi(String id) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    Map<String, dynamic> data = {
      'receiverId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.sendConnectionReq, data, tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> undoConnectionReqApi(String id) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    Map<String, dynamic> data = {
      'receiverId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.undoConnectionReq, data, tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

    Future<http.Response> removeConnectionApi(String id) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    Map<String, dynamic> data = {
      'friendId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.removeConnection, data, tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

     Future<http.Response> acceptConnectionRequestApi(String id) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    Map<String, dynamic> data = {
      'requestId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.acceptRequest, data, tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
  
    Future<http.Response> rejectConnectionRequest(String id) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    Map<String, dynamic> data = {
      'requestId': id,
    };
    try {
      final response = await locator<NetworkApiService>().getPostApiResponseWithToken(ApiEndPoint.rejectRequest, data, tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> getSingleProfile(String profileId) async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    log!;
    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.getSingleProfile + profileId, null, token: tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

    Future<http.Response> getUserMatrimonialProfile() async {
    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;

    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.getUserMatrimonialProfile, null, token: tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> getProfileCompletionStatus(String profileId) async {

    var tokenN = StoragePrefs.getUserAccessTokenFromStorage;
    debugPrint(tokenN);
    try {
      final response = await locator<NetworkApiService>().getApiResponseWithToken(ApiEndPoint.getProfileCompletionStatus + profileId, null, token: tokenN);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
