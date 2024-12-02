import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jaat_app/core/models/create_matrimonial_profile_model.dart';
import 'package:jaat_app/core/network/api_end_point.dart';
import 'package:jaat_app/core/services/app_storage.dart';
import 'package:stacked/stacked.dart';

class MatrimonialProfileService extends BaseViewModel {
  // Singleton pattern
  static final MatrimonialProfileService _instance = MatrimonialProfileService._internal();

  factory MatrimonialProfileService() {
    return _instance;
  }

  MatrimonialProfileService._internal();

  final CreateMatrimonialProfileModel _createMatrimonialProfileModel = CreateMatrimonialProfileModel();

  // Getter and Setter for each field in CreateMatrimonialProfileModel

  // id
  // String? get id => _createMatrimonialProfileModel.id;
  set id(String? id) {
    _createMatrimonialProfileModel.id = id;
    notifyListeners();
  }

  // userId
  UserId? get userId => _createMatrimonialProfileModel.userId;
  set userId(UserId? userId) {
    _createMatrimonialProfileModel.userId = userId;
    notifyListeners();
  }

  // profileFor
  String? get profileFor => _createMatrimonialProfileModel.profileFor;
  set profileFor(String? profileFor) {
    _createMatrimonialProfileModel.profileFor = profileFor;
    log(_createMatrimonialProfileModel.profileFor.toString());
    notifyListeners();
  }

  // firstName
  String? get firstName => _createMatrimonialProfileModel.firstName;
  set firstName(String? firstName) {
    _createMatrimonialProfileModel.firstName = firstName;
    log(_createMatrimonialProfileModel.firstName.toString());
    notifyListeners();
  }

  // lastName
  String? get lastName => _createMatrimonialProfileModel.lastName;
  set lastName(String? lastName) {
    _createMatrimonialProfileModel.lastName = lastName;
    log(_createMatrimonialProfileModel.lastName.toString());
    notifyListeners();
  }

  // gender
  String? get gender => _createMatrimonialProfileModel.gender;
  set gender(String? gender) {
    _createMatrimonialProfileModel.gender = gender;
    notifyListeners();
  }

  // dateOfBirth
  String? get dateOfBirth => _createMatrimonialProfileModel.dateOfBirth;
  set dateOfBirth(String? dateOfBirth) {
    _createMatrimonialProfileModel.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  // about
  String? get about => _createMatrimonialProfileModel.about;
  set about(String? about) {
    _createMatrimonialProfileModel.about = about;
    notifyListeners();
  }

  // profilePicture
  List<dynamic>? get profilePicture => _createMatrimonialProfileModel.profilePicture;
  set profilePicture(List<dynamic>? profilePicture) {
    _createMatrimonialProfileModel.profilePicture = profilePicture;
    notifyListeners();
  }

  List<dynamic>? get hobbies => _createMatrimonialProfileModel.hobbies;
  set hobbies(List<dynamic>? hobbies) {
    _createMatrimonialProfileModel.hobbies = hobbies;
    notifyListeners();
  }

  String? get phoneNo => _createMatrimonialProfileModel.phoneNo;
  set updatePhoneNo(String? value) {
    _createMatrimonialProfileModel.phoneNo = value;
    notifyListeners();
  }

  // showGender
  bool? get showGender => _createMatrimonialProfileModel.showGender;
  set showGender(bool? showGender) {
    _createMatrimonialProfileModel.showGender = showGender;
    notifyListeners();
  }

  // email
  String? get email => _createMatrimonialProfileModel.email;
  set email(String? email) {
    _createMatrimonialProfileModel.email = email;
    notifyListeners();
  }

  // country
  String? get country => _createMatrimonialProfileModel.country;
  set country(String? country) {
    _createMatrimonialProfileModel.country = country;
    notifyListeners();
  }

  // state
  String? get state => _createMatrimonialProfileModel.state;
  set state(String? state) {
    _createMatrimonialProfileModel.state = state;
    notifyListeners();
  }

  // city
  String? get city => _createMatrimonialProfileModel.city;
  set city(String? city) {
    _createMatrimonialProfileModel.city = city;
    notifyListeners();
  }

  // citizenship
  String? get citizenship => _createMatrimonialProfileModel.citizenship;
  set citizenship(String? citizenship) {
    _createMatrimonialProfileModel.citizenship = citizenship;
    notifyListeners();
  }

  // residence
  String? get residence => _createMatrimonialProfileModel.residence;
  set residence(String? residence) {
    _createMatrimonialProfileModel.residence = residence;
    notifyListeners();
  }

  // livingWith
  String? get livingWith => _createMatrimonialProfileModel.livingWith;
  set livingWith(String? livingWith) {
    _createMatrimonialProfileModel.livingWith = livingWith;
    notifyListeners();
  }

  // martialStatus
  String? get martialStatus => _createMatrimonialProfileModel.martialStatus;
  set martialStatus(String? martialStatus) {
    _createMatrimonialProfileModel.martialStatus = martialStatus;
    notifyListeners();
  }

  // diet
  String? get diet => _createMatrimonialProfileModel.diet;
  set diet(String? diet) {
    _createMatrimonialProfileModel.diet = diet;
    notifyListeners();
  }

  // height
  String? get height => _createMatrimonialProfileModel.height;
  set height(String? height) {
    _createMatrimonialProfileModel.height = height;
    notifyListeners();
  }

  // income
  String? get income => _createMatrimonialProfileModel.income;
  set income(String? income) {
    _createMatrimonialProfileModel.income = income;
    notifyListeners();
  }

  // motherTongue
  String? get motherTongue => _createMatrimonialProfileModel.motherTongue;
  set motherTongue(String? motherTongue) {
    _createMatrimonialProfileModel.motherTongue = motherTongue;
    notifyListeners();
  }

  // education
  Education? get education => _createMatrimonialProfileModel.education;
  set education(Education? education) {
    _createMatrimonialProfileModel.education = education!;
    notifyListeners();
  }

  // otherQualification
  OtherQualification? get otherQualification => _createMatrimonialProfileModel.otherQualification;
  set otherQualification(OtherQualification? otherQualification) {
    _createMatrimonialProfileModel.otherQualification = otherQualification!;
    notifyListeners();
  }

  // career
  Career? get career => _createMatrimonialProfileModel.career;
  set career(Career? career) {
    _createMatrimonialProfileModel.career = career!;
    notifyListeners();
  }

  // intrests
  String? get intrests => _createMatrimonialProfileModel.intrests;
  set intrests(String? intrests) {
    _createMatrimonialProfileModel.intrests = intrests;
    notifyListeners();
  }

  // religiousInformation
  ReligiousInformation? get religiousInformation => _createMatrimonialProfileModel.religiousInformation;
  set religiousInformation(ReligiousInformation? religiousInformation) {
    _createMatrimonialProfileModel.religiousInformation = religiousInformation!;
    notifyListeners();
  }

// FamilyInformation
  FamilyInformation? get familyInformation => _createMatrimonialProfileModel.familyInformation;
  set familyInformation(FamilyInformation? familyInformation) {
    _createMatrimonialProfileModel.familyInformation = familyInformation!;
    notifyListeners();
  }

  // Function to call the API and create the user profile
  Future<http.Response> createProfileApi() async {
    // try {
    final uri = Uri.parse(ApiEndPoint.createProfile);

    var token = StoragePrefs.getUserAccessTokenFromStorage; // Create the URI for the endpoint

    // Prepare form-data
    final request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token'; // Set the authorization token

    // Add fields from the model to the request
    // request.fields['_id'] = _createMatrimonialProfileModel.id ?? '';
    // request.fields['userId'] = _createMatrimonialProfileModel.userId.toString();
    request.fields['profileFor'] = _createMatrimonialProfileModel.profileFor ?? '';
    request.fields['firstName'] = _createMatrimonialProfileModel.firstName ?? '';
    request.fields['lastName'] = _createMatrimonialProfileModel.lastName ?? '';
    request.fields['phoneNo'] = _createMatrimonialProfileModel.phoneNo ?? '';
    request.fields['about'] = _createMatrimonialProfileModel.about ?? '';
    request.fields['gender'] = _createMatrimonialProfileModel.gender ?? '';
    request.fields['showGender'] = (_createMatrimonialProfileModel.showGender ?? false).toString();
    request.fields['email'] = _createMatrimonialProfileModel.email ?? '';
    request.fields['country'] = _createMatrimonialProfileModel.country ?? '';
    request.fields['state'] = _createMatrimonialProfileModel.state ?? '';
    request.fields['city'] = _createMatrimonialProfileModel.city ?? '';
    request.fields['citizenship'] = _createMatrimonialProfileModel.citizenship ?? '';
    request.fields['residence'] = _createMatrimonialProfileModel.residence ?? '';
    request.fields['livingWith'] = _createMatrimonialProfileModel.livingWith ?? '';
    request.fields['martialStatus'] = _createMatrimonialProfileModel.martialStatus ?? '';
    request.fields['diet'] = _createMatrimonialProfileModel.diet ?? '';
    request.fields['height'] = _createMatrimonialProfileModel.height ?? '';
    request.fields['income'] = _createMatrimonialProfileModel.income ?? '';
    request.fields['motherTongue'] = _createMatrimonialProfileModel.motherTongue ?? '';
    request.fields['intrests'] = _createMatrimonialProfileModel.intrests ?? '';
    request.fields['dateOfBirth'] = _createMatrimonialProfileModel.dateOfBirth ?? '';


    // Add files if any (e.g., profilePicture)
    inspect(_createMatrimonialProfileModel.profilePicture);
    
    if (_createMatrimonialProfileModel.profilePicture != null) {
      for (var i = 0; i < _createMatrimonialProfileModel.profilePicture!.length; i++) {
        final file = _createMatrimonialProfileModel.profilePicture?[i];
        request.files.add(await http.MultipartFile.fromPath('profilePicture', file));
      }
    }

    // Add nested objects as JSON strings if necessary
    if (_createMatrimonialProfileModel.education != null) {
      request.fields['education'] = json.encode(_createMatrimonialProfileModel.education!.toMap());
    }
    if (_createMatrimonialProfileModel.otherQualification != null) {
      request.fields['otherQualification'] = json.encode(_createMatrimonialProfileModel.otherQualification!.toMap());
    }
    if (_createMatrimonialProfileModel.career != null) {
      request.fields['career'] = json.encode(_createMatrimonialProfileModel.career!.toMap());
    }
    if (_createMatrimonialProfileModel.religiousInformation != null) {
      request.fields['religiousInformation'] = json.encode(_createMatrimonialProfileModel.religiousInformation!.toMap());
    }
    if (_createMatrimonialProfileModel.familyInformation != null) {
      request.fields['familyInformation'] = json.encode(_createMatrimonialProfileModel.familyInformation!.toMap());
    }

    // Send the request
    final response = await request.send();

    // Handle response
    final responseData = await http.Response.fromStream(response);
    log(responseData.body);

    if (responseData.statusCode == 201) {
      if (kDebugMode) {
        print("Matrimonial Profile created successfully.");
      }
    } else {
      if (kDebugMode) {
        print("Failed to create profile. Status code: ${responseData.statusCode}");
      }
    }

    return responseData;
    // } catch (e) {
    //   throw Exception("Failed to create profile: $e");
    // }
  }

  // Function to call the API and create the user profile
  // Future<http.Response> createProfileApi() async {
  //   try {
  //     // Convert the CreateMatrimonialProfileModel instance to JSON
  //     // String jsonData = _createMatrimonialProfileModel.toJson();
  //     String jsonData = '';
  //     try {
  //    jsonData = _createMatrimonialProfileModel.toJson();
  //   if (kDebugMode) {
  //     print(jsonData);
  //   }  // Check the output
  //     } catch (e, stackTrace) {
  //         if (kDebugMode) {
  //           print("Error during JSON conversion: $e");
  //         }
  //         if (kDebugMode) {
  //           print(stackTrace);
  //         }
  //     }

  //     // Call the API
  //     final response = await locator<NetworkApiService>().getPostApiResponseWithToken(
  //       ApiEndPoint.createProfile, // Adjust the endpoint as necessary
  //       jsonData,
  //       token, // Adjust the token if necessary
  //     );

  //     return response;
  //   } catch (e) {
  //     throw Exception("Failed to create profile: $e");
  //   }
  // }
}
