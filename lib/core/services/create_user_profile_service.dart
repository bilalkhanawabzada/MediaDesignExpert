import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jaat_app/core/models/create_user_profile_model.dart';
import 'package:jaat_app/core/network/api_end_point.dart';
import 'package:jaat_app/core/services/app_storage.dart';
import 'package:stacked/stacked.dart';

class UserProfileService extends BaseViewModel {
  // Singleton pattern
  static final UserProfileService _instance = UserProfileService._internal();

  factory UserProfileService() {
    return _instance;
  }

  UserProfileService._internal();

  final UserProfileModel _userProfileModel = UserProfileModel(
    token: '',
    firstName: '',
    lastName: '',
    profilePicture: '',
    username: '',
    dob: '',
  );

  // Getter for UserProfile
  UserProfileModel get userProfile => _userProfileModel;

  // Update methods
  void updateFirstAndLastName(String firstName, String lastName) {
    _userProfileModel.firstName = firstName;
    _userProfileModel.lastName = lastName;
    notifyListeners();
  }

  void updateUserName(String userName) {
    _userProfileModel.username = userName;
    notifyListeners();
  }

  void updateProfilePicture(String image) {
    _userProfileModel.profilePicture = image;
    notifyListeners();
  }

  void updateDob(String date) {
    _userProfileModel.dob = date;
    notifyListeners();
  }

  // Add other update methods as needed...

  // Function to call the API and create the user profile
  Future<http.Response> createUserProfileApi() async {
    var token = StoragePrefs.getUserAccessTokenFromStorage;

    final uri = Uri.parse(ApiEndPoint.createUserProfile);
    // Prepare form-data
    final request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['firstName'] = _userProfileModel.firstName;
    request.fields['lastName'] = _userProfileModel.lastName;
    request.fields['username'] = _userProfileModel.username;
    request.fields['dob'] = _userProfileModel.dob;

    if (_userProfileModel.profilePicture.isNotEmpty) {
      final file = _userProfileModel.profilePicture;
      request.files.add(await http.MultipartFile.fromPath('profilePicture', file));
    }

    // Send the request
    final response = await request.send();

    // Handle response
    final responseData = await http.Response.fromStream(response);
    log(responseData.body);

    if (responseData.statusCode == 201 || responseData.statusCode == 201) {
      if (kDebugMode) {
        print("User Profile created successfully.");
      }
    } else {
      if (kDebugMode) {
        print("Failed to create profile. Status code: ${responseData.statusCode}");
      }
    }

    return responseData;

    // try {
    //   // Convert the UserProfileModel instance to JSON
    //   String jsonData = _userProfileModel.toJson();

    //   Map userName={'username': _userProfileModel.username};

    //   // Call the API
    //   final response =
    //       await locator<NetworkApiService>().getPostApiResponseWithToken(
    //     ApiEndPoint.createUserProfile,
    //     userName,
    //     _userProfileModel.token,
    //   );

    //   return response;
    // } catch (e) {
    //   throw Exception("Failed to create user profile: $e");
    // }
  } // Api Call End
}

// import 'package:http/http.dart' as http;
// import 'package:jaat_app/core/base/base_service.dart';
// import 'package:jaat_app/core/locator.dart';
// import 'package:jaat_app/core/models/create_user_profile.dart';
// import 'package:jaat_app/core/network/api_end_point.dart';
// import 'package:jaat_app/core/network_api_service.dart';

// class CreateUserProfileService extends BaseService {
//   CreateUserProfileService();

//   Future<http.Response> createUserProfileApi({
//     required String token,
//     required String firstName,
//     required String lastName,
//     required dynamic profilePicture,
//     required String username,
//   }) async {
//     try {
//       // Create an instance of UserProfile
//       UserProfileModel createUserProfileObj = UserProfileModel(
//         token: token,
//         firstName: firstName,
//         lastName: lastName,
//         profilePicture: profilePicture,
//         username: username,
//       );

//       // Convert the UserProfile instance to JSON
//       String jsonData = createUserProfileObj.toJson();

//       // Call the API with the JSON data
//       final response = await locator<NetworkApiService>()
//           .getPostApiResponseWithToken(ApiEndPoint.createUserProfile, jsonData, token);

//       return response;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

// // import 'package:http/http.dart' as http;
// // import 'package:jaat_app/core/base/base_service.dart';
// // import 'package:jaat_app/core/locator.dart';
// // import 'package:jaat_app/core/models/create_user_profile.dart';
// // import 'package:jaat_app/core/network/api_end_point.dart';
// // import 'package:jaat_app/core/network_api_service.dart';

// // class CreateUserProfileService  extends BaseService{

// // CreateUserProfileService(){
// //     String token = '';
// //          String firstName= '';
// //          String lastName= '';
// //          String   profilePicture= '';
// //          String  username= '';

// //         UserProfile createUserProfile = UserProfile(token: token, firstName: firstName, lastName: lastName, profilePicture: profilePicture, username: username);
// // }

// //  Future<http.Response> createUserProfileApi({dynamic data, token}) async {
// //     try {
// //       final response = await locator<NetworkApiService>()
// //           .getPostApiResponseWithToken(ApiEndPoint.createUserProfile, data, token);
// //       return response;
// //     } catch (e) {
// //       throw Exception(e);
// //     }
// //   }

// // }
