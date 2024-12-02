import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/models/create_matrimonial_profile_model.dart';
import 'package:jaat_app/core/network/api_end_point.dart';
import 'package:jaat_app/core/network_api_service.dart';
import 'package:jaat_app/core/services/app_storage.dart';
import 'package:mime/mime.dart';
import 'package:stacked/stacked.dart';


class UpdateMatrimonialProfileService extends BaseViewModel {
  // Singleton pattern
  static final UpdateMatrimonialProfileService _instance = UpdateMatrimonialProfileService._internal();

  factory UpdateMatrimonialProfileService() {
    return _instance;
  }

  UpdateMatrimonialProfileService._internal();

  final CreateMatrimonialProfileModel updateMatrimonialProfileModel = CreateMatrimonialProfileModel();

  // Getter and Setter for each field in CreateMatrimonialProfileModel

  // id
  // String? get id => updateMatrimonialProfileModel.id;
  set id(String? id) {
    updateMatrimonialProfileModel.id = id;
    notifyListeners();
  }

  // userId
  UserId? get userId => updateMatrimonialProfileModel.userId;
  set userId(UserId? userId) {
    updateMatrimonialProfileModel.userId = userId;
    notifyListeners();
  }

  // profileFor
  String? get profileFor => updateMatrimonialProfileModel.profileFor;
  set profileFor(String? profileFor) {
    updateMatrimonialProfileModel.profileFor = profileFor;
    log(updateMatrimonialProfileModel.profileFor.toString());
    notifyListeners();
  }

  // firstName
  String? get firstName => updateMatrimonialProfileModel.firstName;
  set firstName(String? firstName) {
    updateMatrimonialProfileModel.firstName = firstName;
    log(updateMatrimonialProfileModel.firstName.toString());
    notifyListeners();
  }

  // lastName
  String? get lastName => updateMatrimonialProfileModel.lastName;
  set lastName(String? lastName) {
    updateMatrimonialProfileModel.lastName = lastName;
    log(updateMatrimonialProfileModel.lastName.toString());
    notifyListeners();
  }

  // gender
  String? get gender => updateMatrimonialProfileModel.gender;
  set gender(String? gender) {
    updateMatrimonialProfileModel.gender = gender;
    notifyListeners();
  }

  // dateOfBirth
  String? get dateOfBirth => updateMatrimonialProfileModel.dateOfBirth;
  set dateOfBirth(String? dateOfBirth) {
    updateMatrimonialProfileModel.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  // about
  String? get about => updateMatrimonialProfileModel.about;
  set about(String? about) {
    updateMatrimonialProfileModel.about = about;
    notifyListeners();
  }

  // profilePicture
  List<dynamic>? get profilePicture => updateMatrimonialProfileModel.profilePicture;
  set profilePicture(List<dynamic>? profilePicture) {
    updateMatrimonialProfileModel.profilePicture = profilePicture;
    notifyListeners();
  }

  List<dynamic>? get hobbies => updateMatrimonialProfileModel.hobbies;
  set hobbies(List<dynamic>? hobbies) {
    updateMatrimonialProfileModel.hobbies = hobbies;
    notifyListeners();
  }

  String? get phoneNo => updateMatrimonialProfileModel.phoneNo;
  set updatePhoneNo(String? value) {
    updateMatrimonialProfileModel.phoneNo = value;
    notifyListeners();
  }

  // showGender
  bool? get showGender => updateMatrimonialProfileModel.showGender;
  set showGender(bool? showGender) {
    updateMatrimonialProfileModel.showGender = showGender;
    notifyListeners();
  }

  // email
  String? get email => updateMatrimonialProfileModel.email;
  set email(String? email) {
    updateMatrimonialProfileModel.email = email;
    notifyListeners();
  }

  // country
  String? get country => updateMatrimonialProfileModel.country;
  set country(String? country) {
    updateMatrimonialProfileModel.country = country;
    notifyListeners();
  }

  // state
  String? get state => updateMatrimonialProfileModel.state;
  set state(String? state) {
    updateMatrimonialProfileModel.state = state;
    notifyListeners();
  }

  // city
  String? get city => updateMatrimonialProfileModel.city;
  set city(String? city) {
    updateMatrimonialProfileModel.city = city;
    notifyListeners();
  }

  // citizenship
  String? get citizenship => updateMatrimonialProfileModel.citizenship;
  set citizenship(String? citizenship) {
    updateMatrimonialProfileModel.citizenship = citizenship;
    notifyListeners();
  }

  // residence
  String? get residence => updateMatrimonialProfileModel.residence;
  set residence(String? residence) {
    updateMatrimonialProfileModel.residence = residence;
    notifyListeners();
  }

  // livingWith
  String? get livingWith => updateMatrimonialProfileModel.livingWith;
  set livingWith(String? livingWith) {
    updateMatrimonialProfileModel.livingWith = livingWith;
    notifyListeners();
  }

  // martialStatus
  String? get martialStatus => updateMatrimonialProfileModel.martialStatus;
  set martialStatus(String? martialStatus) {
    updateMatrimonialProfileModel.martialStatus = martialStatus;
    notifyListeners();
  }

  // diet
  String? get diet => updateMatrimonialProfileModel.diet;
  set diet(String? diet) {
    updateMatrimonialProfileModel.diet = diet;
    notifyListeners();
  }

  // height
  String? get height => updateMatrimonialProfileModel.height;
  set height(String? height) {
    updateMatrimonialProfileModel.height = height;
    notifyListeners();
  }

  // income
  String? get income => updateMatrimonialProfileModel.income;
  set income(String? income) {
    updateMatrimonialProfileModel.income = income;
    notifyListeners();
  }

  // motherTongue
  String? get motherTongue => updateMatrimonialProfileModel.motherTongue;
  set motherTongue(String? motherTongue) {
    updateMatrimonialProfileModel.motherTongue = motherTongue;
    notifyListeners();
  }

  // education
  Education? get education => updateMatrimonialProfileModel.education;
  set education(Education? education) {
    updateMatrimonialProfileModel.education = null;
    updateMatrimonialProfileModel.education = education;
    notifyListeners();
  }

  // otherQualification
  OtherQualification? get otherQualification => updateMatrimonialProfileModel.otherQualification;
  set otherQualification(OtherQualification? otherQualification) {
    updateMatrimonialProfileModel.otherQualification = null;
    updateMatrimonialProfileModel.otherQualification = otherQualification!;
    notifyListeners();
  }

  // career
  Career? get career => updateMatrimonialProfileModel.career;
  set career(Career? career) {
    updateMatrimonialProfileModel.career = null;
    updateMatrimonialProfileModel.career = career!;
    notifyListeners();
  }

  // intrests
  String? get intrests => updateMatrimonialProfileModel.intrests;
  set intrests(String? intrests) {
    updateMatrimonialProfileModel.intrests = intrests;
    notifyListeners();
  }

  // religiousInformation
  ReligiousInformation? get religiousInformation => updateMatrimonialProfileModel.religiousInformation;
  set religiousInformation(ReligiousInformation? religiousInformation) {
    updateMatrimonialProfileModel.religiousInformation  = null;
    updateMatrimonialProfileModel.religiousInformation = religiousInformation!;
    notifyListeners();
  }

// FamilyInformation
  FamilyInformation? get familyInformation => updateMatrimonialProfileModel.familyInformation;
  set familyInformation(FamilyInformation? familyInformation) {
    updateMatrimonialProfileModel.familyInformation = familyInformation!;
    notifyListeners();
  }

  // Map<String, String> updatedImages = {};


// Function to update user matrimonial profile
Future<http.Response> updateMatrimonialProfileApi({Map<String, String>? updatedImages}) async {
  final uri = Uri.parse(ApiEndPoint.updateMatriMonialProfile);

  var token = StoragePrefs.getUserAccessTokenFromStorage;

  // Prepare form-data
  final request = http.MultipartRequest('PUT', uri);
  request.headers['Authorization'] = 'Bearer $token'; // Set the authorization token

  // Add form fields
  request.fields['profileFor'] = updateMatrimonialProfileModel.profileFor ?? '';
  request.fields['firstName'] = updateMatrimonialProfileModel.firstName ?? '';
  request.fields['lastName'] = updateMatrimonialProfileModel.lastName ?? '';
  request.fields['phoneNo'] = updateMatrimonialProfileModel.phoneNo ?? '';
  request.fields['about'] = updateMatrimonialProfileModel.about ?? '';
  request.fields['gender'] = updateMatrimonialProfileModel.gender ?? '';
  request.fields['showGender'] = (updateMatrimonialProfileModel.showGender ?? false).toString();
  request.fields['email'] = updateMatrimonialProfileModel.email ?? '';
  request.fields['country'] = updateMatrimonialProfileModel.country ?? '';
  request.fields['state'] = updateMatrimonialProfileModel.state ?? '';
  request.fields['city'] = updateMatrimonialProfileModel.city ?? '';
  request.fields['citizenship'] = updateMatrimonialProfileModel.citizenship ?? '';
  request.fields['residence'] = updateMatrimonialProfileModel.residence ?? '';
  request.fields['livingWith'] = updateMatrimonialProfileModel.livingWith ?? '';
  request.fields['martialStatus'] = updateMatrimonialProfileModel.martialStatus ?? '';
  request.fields['diet'] = updateMatrimonialProfileModel.diet ?? '';
  request.fields['height'] = updateMatrimonialProfileModel.height ?? '';
  request.fields['income'] = updateMatrimonialProfileModel.income ?? '';
  request.fields['motherTongue'] = updateMatrimonialProfileModel.motherTongue ?? '';
  request.fields['intrests'] = updateMatrimonialProfileModel.intrests ?? '';
  request.fields['dateOfBirth'] = updateMatrimonialProfileModel.dateOfBirth ?? '';


  // Add images from updatedImages map



  
        // if (updatedImages != null && updatedImages.isNotEmpty) {
        //   for (var entry in updatedImages.entries) {
        //     final key = entry.key;
        //     final filePath = entry.value;
        //     if (filePath.isNotEmpty) {
        //       final file = File(filePath);
        //       if (await file.exists()) {
        //         // Extract the MIME type from the file extension
        //         final mimeTypeData = lookupMimeType(filePath)?.split('/') ?? ['application', 'octet-stream'];
                
        //         request.files.add(
        //           await http.MultipartFile.fromPath(
        //             key, 
        //             filePath,
        //             contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
        //           ),
        //         );
        //       }
        //       else{
        //         log('Image path not found');
        //       }
        //     }
        //   }
        // }

if (updatedImages != null && updatedImages.isNotEmpty) {
  for (var entry in updatedImages.entries) {
    final key = entry.key;
    final filePath = entry.value;

    log('Processing file for key: $key with path: $filePath');

    if (filePath.isNotEmpty) {
      // Normalize the path
      final filePathNormalized = filePath.replaceAll("\\", "/");
      final file = File(filePathNormalized);

      // Log file path length
      log('Normalized file path: $filePathNormalized');
      log('File path length: ${filePathNormalized.length}');

      // Check if file exists
      final fileExists = await file.exists();
      log('File exists: $fileExists');

      if (fileExists) {
        // Extract the MIME type from the file extension
        final mimeTypeData = lookupMimeType(filePathNormalized)?.split('/') ?? ['application', 'octet-stream'];
        
        request.files.add(
          await http.MultipartFile.fromPath(
            key, 
            filePathNormalized,
            
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
          ),
        );
      } else {
        log('Image path not found: $filePathNormalized');
      }
    } else {
      log('File path is empty for key: $key');
    }
  }
}



  // Add images from updatedImages map
// if (updatedImages != null && updatedImages.isNotEmpty) {
//   for (var entry in updatedImages.entries) {
//     final key = entry.key;
//     final filePath = entry.value;
//     if (filePath.isNotEmpty) {
//       final file = File(filePath);
//       if (await file.exists()) {
//         request.files.add(await http.MultipartFile.fromPath(key, filePath,
//         )
        
//         );

//       }
//     }
//   }
// }

  // if (updatedImages != null && updatedImages!.isNotEmpty) {
  //   updatedImages.forEach((key, filePath) async {
  //     if (filePath.isNotEmpty) {
  //       final file = File(filePath);
  //       if (await file.exists()) {
  //         request.files.add(await http.MultipartFile.fromPath(key, filePath));
  //       }
  //     }
  //   });
  // }

  // Add nested objects as JSON strings if necessary
  if (updateMatrimonialProfileModel.education != null) {
    request.fields['education'] = json.encode(updateMatrimonialProfileModel.education!.toMap());
  }
  if (updateMatrimonialProfileModel.otherQualification != null) {
    request.fields['otherQualification'] = json.encode(updateMatrimonialProfileModel.otherQualification!.toMap());
  }
  if (updateMatrimonialProfileModel.career != null) {
    request.fields['career'] = json.encode(updateMatrimonialProfileModel.career!.toMap());
  }
  if (updateMatrimonialProfileModel.religiousInformation != null) {
    request.fields['religiousInformation'] = json.encode(updateMatrimonialProfileModel.religiousInformation!.toMap());
  }
  if (updateMatrimonialProfileModel.familyInformation != null) {
    request.fields['familyInformation'] = json.encode(updateMatrimonialProfileModel.familyInformation!.toMap());
  }

  // Send the request
  final response = await request.send();

  // Handle response
  final responseData = await http.Response.fromStream(response);
  log(responseData.body);

  if (responseData.statusCode == 201 || responseData.statusCode == 200) {
    if (kDebugMode) {
      print("Profile Updated successfully.");
    }
  } else {
    if (kDebugMode) {
      print("Failed to Update profile. Status code: ${responseData.statusCode}");
    }
  }

  return responseData;
}


    final token = StoragePrefs.getUserAccessTokenFromStorage;

  Future<http.Response> deleteProfileApi() async {
    try {
      final response = await locator<NetworkApiService>().getApiDeleteWithToken(ApiEndPoint.deleteMatrimonialProfile, null, token: token);
      inspect(response);
      return response;
    } catch (e) {
      inspect(e);
      throw Exception(e);
    }
  }



}

//   // Function to update user matrimonial profile
//   Future<http.Response> updateMatrimonialProfileApi() async {
//     // try {
//     final uri = Uri.parse(ApiEndPoint.updateMatriMonialProfile);

//     var token = StoragePrefs.getUserAccessTokenFromStorage;

//     // Prepare form-data
//     final request = http.MultipartRequest('PUT', uri);
//     request.headers['Authorization'] = 'Bearer $token'; // Set the authorization token

    
//     request.fields['profileFor'] = updateMatrimonialProfileModel.profileFor ?? '';
//     request.fields['firstName'] = updateMatrimonialProfileModel.firstName ?? '';
//     request.fields['lastName'] = updateMatrimonialProfileModel.lastName ?? '';
//     request.fields['phoneNo'] = updateMatrimonialProfileModel.phoneNo ?? '';
//     request.fields['about'] = updateMatrimonialProfileModel.about ?? '';
//     request.fields['gender'] = updateMatrimonialProfileModel.gender ?? '';
//     request.fields['showGender'] = (updateMatrimonialProfileModel.showGender ?? false).toString();
//     request.fields['email'] = updateMatrimonialProfileModel.email ?? '';
//     request.fields['country'] = updateMatrimonialProfileModel.country ?? '';
//     request.fields['state'] = updateMatrimonialProfileModel.state ?? '';
//     request.fields['city'] = updateMatrimonialProfileModel.city ?? '';
//     request.fields['citizenship'] = updateMatrimonialProfileModel.citizenship ?? '';
//     request.fields['residence'] = updateMatrimonialProfileModel.residence ?? '';
//     request.fields['livingWith'] = updateMatrimonialProfileModel.livingWith ?? '';
//     request.fields['martialStatus'] = updateMatrimonialProfileModel.martialStatus ?? '';
//     request.fields['diet'] = updateMatrimonialProfileModel.diet ?? '';
//     request.fields['height'] = updateMatrimonialProfileModel.height ?? '';
//     request.fields['income'] = updateMatrimonialProfileModel.income ?? '';
//     request.fields['motherTongue'] = updateMatrimonialProfileModel.motherTongue ?? '';
//     request.fields['intrests'] = updateMatrimonialProfileModel.intrests ?? '';

//     // Add files if any (e.g., profilePicture)
//     inspect(updateMatrimonialProfileModel.profilePicture);

//     // if (updateMatrimonialProfileModel.profilePicture != null) {
//     //   for (var i = 0; i < updateMatrimonialProfileModel.profilePicture!.length; i++) {
//     //     final file = updateMatrimonialProfileModel.profilePicture?[i];
//     //     request.files.add(await http.MultipartFile.fromPath('profilePicture', file));
//     //   }
//     // }

//     if (updatedImages.isNotEmpty) {
//   updatedImages.forEach((key, filePath) async {
//     request.files.add(await http.MultipartFile.fromPath(key, filePath));
//   });
// }


//     // Add nested objects as JSON strings if necessary
//     if (updateMatrimonialProfileModel.education != null) {
//       request.fields['education'] = json.encode(updateMatrimonialProfileModel.education!.toMap());
//     }
//     if (updateMatrimonialProfileModel.otherQualification != null) {
//       request.fields['otherQualification'] = json.encode(updateMatrimonialProfileModel.otherQualification!.toMap());
//     }
//     if (updateMatrimonialProfileModel.career != null) {
//       request.fields['career'] = json.encode(updateMatrimonialProfileModel.career!.toMap());
//     }
//     if (updateMatrimonialProfileModel.religiousInformation != null) {
//       request.fields['religiousInformation'] = json.encode(updateMatrimonialProfileModel.religiousInformation!.toMap());
//     }
//     if (updateMatrimonialProfileModel.familyInformation != null) {
//       request.fields['familyInformation'] = json.encode(updateMatrimonialProfileModel.familyInformation!.toMap());
//     }

//     // Send the request
//     final response = await request.send();

//     // Handle response
//     final responseData = await http.Response.fromStream(response);
//     log(responseData.body);

//     if (responseData.statusCode == 201 || responseData.statusCode == 200) {
//       if (kDebugMode) {
//         print("Profile Updated successfully.");
//       }
//     } else {
//       if (kDebugMode) {
//         print("Failed to Update profile. Status code: ${responseData.statusCode}");
//       }
//     }

//     return responseData;
//     // } catch (e) {
//     //   throw Exception("Failed to create profile: $e");
//     // }
//   }

  // Delete Matrimonial Profile API

  // Future<http.Response> deleteMatrimonialProfileApi() async {
  //   var token = StoragePrefs.getUserAccessTokenFromStorage;

  //   try {
      
  //     // Call the API
  //     final response = await locator<NetworkApiService>().getPostApiResponseWithToken(
  //       ApiEndPoint.deleteMatrimonialProfile, token );

  //     return response;
  //   } catch (e) {
  //     throw Exception("Failed to create profile: $e");
  //   }
  // }





