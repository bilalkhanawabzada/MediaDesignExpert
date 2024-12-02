// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  Profile? profile;
  String? message;

  ProfileModel({
    this.profile,
    this.message,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "message": message,
      };
}

class Profile {
  String? id;
  UserId? userId;
  String? phoneNo;
  String? profileFor;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? about;
  List<String>? profilePicture;
  String? gender;
  bool? showGender;
  String? email;
  String? country;
  String? state;
  String? city;
  String? citizenship;
  String? residence;
  String? livingWith;
  String? martialStatus;
  String? diet;
  String? height;
  String? income;
  String? motherTongue;
  Education? education;
  OtherQualification? otherQualification;
  Career? career;
  String? intrests;
  ReligiousInformation? religiousInformation;
  FamilyInformation? familyInformation;
  String? serialnumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Profile({
    this.id,
    this.userId,
    this.phoneNo,
    this.profileFor,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.about,
    this.profilePicture,
    this.gender,
    this.showGender,
    this.email,
    this.country,
    this.state,
    this.city,
    this.citizenship,
    this.residence,
    this.livingWith,
    this.martialStatus,
    this.diet,
    this.height,
    this.income,
    this.motherTongue,
    this.otherQualification,
    this.education,
    this.career,
    this.intrests,
    this.religiousInformation,
    this.familyInformation,
    this.serialnumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["_id"],
        serialnumber: json["serialnumber"],
        userId: json["userId"] == null ? null : json["userId"].runtimeType == String
        ? UserId.fromJsonString("userId")
        : UserId.fromJson(json["userId"]),
        phoneNo: json["phoneNo"] ?? '',
        profileFor: json["profileFor"],
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        dateOfBirth: json["dateOfBirth"],
        about: json["about"] ?? '',
        profilePicture: json["profilePicture"] == null ? [] : List<String>.from(json["profilePicture"]!.map((x) => x)),
        gender: json["gender"] ?? '',
        showGender: json["showGender"] ?? false,
        email: json["email"] ?? '',
        country: json["country"] ?? '',
        state: json["state"] ?? '',
        city: json["city"] ?? '',
        citizenship: json["citizenship"] ?? '',
        residence: json["residence"] ?? '',
        livingWith: json["livingWith"] ?? '',
        martialStatus: json["martialStatus"] ?? '',
        diet: json["diet"] ?? '',
        height: json["height"] ?? '',
        income: json["income"] ?? '',
        motherTongue: json["motherTongue"] ?? '',
        education: json["education"] == null
            ? null
            : json["education"].runtimeType == String
                ? Education.fromJson(jsonDecode(json["education"]))
                : Education.fromJson(json["education"]),
        otherQualification: json["otherQualification"] == null
            ? null
            : json["otherQualification"].runtimeType == String
                ? OtherQualification.fromJson(jsonDecode(json["otherQualification"]))
                : OtherQualification.fromJson(json["otherQualification"]),
        career: json["career"] == null
            ? null
            : json["career"].runtimeType == String
                ? Career.fromJson(jsonDecode(json["career"]))
                : Career.fromJson(json["career"]),
        intrests: json["intrests"] ?? '',
        religiousInformation: json["religiousInformation"] ==  null
        ? null
          : json["religiousInformation"].runtimeType == String
            ? ReligiousInformation.fromJson(jsonDecode(json["religiousInformation"]))
            : ReligiousInformation.fromJson(json["religiousInformation"]),
        familyInformation: json["familyInformation"] == null
          ? null
            :json["familyInformation"].runtimeType == String 
            ? FamilyInformation.fromJson(jsonDecode(json["familyInformation"])) 
            : FamilyInformation.fromJson(json["familyInformation"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serialnumber" : serialnumber,
        "userId": userId?.toJson(),
        "profileFor": profileFor,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNo" : phoneNo,
        // "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "about": about,
        "profilePicture": profilePicture == null ? [] : List<dynamic>.from(profilePicture!.map((x) => x)),
        "gender": gender,
        "showGender": showGender,
        "email": email,
        "country": country,
        "state": state,
        "city": city,
        "citizenship": citizenship,
        "residence": residence,
        "livingWith": livingWith,
        "martialStatus": martialStatus,
        "diet": diet,
        "height": height,
        "income": income,
        "motherTongue": motherTongue,
        "education": education?.toJson(),
        "otherQualification": otherQualification?.toJson(),

        "career": career,
        "intrests": intrests,
        "religiousInformation": religiousInformation,
        "familyInformation": familyInformation,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Education {
  String? degree;
  String? fieldOfStudy;
  String? collegeName;
  String? email;
  String? graduationYear;

  Education({
    this.degree,
    this.fieldOfStudy,
    this.collegeName,
    this.email,
    this.graduationYear,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        degree: json["degree"],
        fieldOfStudy: json["fieldOfStudy"],
        collegeName: json["collegeName"],
        email: json["email"],
        graduationYear: json["graduationYear"],
      );

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "fieldOfStudy": fieldOfStudy,
        "collegeName": collegeName,
        "email": email,
        "graduationYear": graduationYear,
      };
}

class UserId {
  String? id;
  String? userId;
  String? firstName;
  String? lastName;

  UserId({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
        factory UserId.fromJsonString(String jsonString)
        {
          return UserId(
          userId: jsonString
          );
          } 
  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class Career {
   String? areYouWorking;
   String? designation;
   String? employerName;
   String? income;

  Career({this.areYouWorking, this.designation, this.employerName, this.income});


  factory Career.fromJson(Map<String, dynamic> json) {

    return Career(
      areYouWorking: json['areYouWorking'],
      designation: json['designation'],
      employerName: json['employerName'],
      income: json['income'],
    );
  }
  // factory Career.fromJson(String jsonString) {
  //   final json = jsonDecode(jsonString);
  //   return Career(
  //     areYouWorking: json[' areYouWorking'],
  //     designation: json['designation'],
  //     employerName: json['employerName'],
  //     income: json['income'],
  //   );
  // }
}

class ReligiousInformation {
   String? subcaste;
   String? star;
   String? grandMotherGothra;
   String? motherSideGothra;
   String? manglik;
   String? timeOfBirth;
   String? countryOfBirth;
   String? stateOfBirth;
   String? cityOfBirth;
   String? raasi;

  ReligiousInformation({
      this.subcaste,
      this.star,
      this.grandMotherGothra,
      this.motherSideGothra,
      this.manglik,
      this.timeOfBirth,
      this.countryOfBirth,
      this.stateOfBirth,
      this.cityOfBirth,
      this.raasi,
  });

  factory ReligiousInformation.fromJson(Map<String , dynamic> json) {
    //  json = jsonDecode(jsonString);
    return ReligiousInformation(
      subcaste: json['subcaste'],
      star: json['star'],
      grandMotherGothra: json['grandMotherGothra'],
      motherSideGothra: json['motherSideGothra'],
      manglik: json['manglik'],
      timeOfBirth: json['timeOfBirth'],
      countryOfBirth: json['countryOfBirth'],
      stateOfBirth: json['stateOfBirth'],
      cityOfBirth: json['cityOfBirth'],
      raasi: json['raasi'],
    );
  }
}

class FamilyInformation {
   String? contactTo;
   String? contactPerson;
   String? familyValue;
   String? familyType;
   String? familyStatus;
   String? familyNetWorth;
   String? familyIncome;
   String? agriCulturalLand;

  FamilyInformation({
     this.contactTo,
     this.contactPerson,
     this.familyValue,
     this.familyType,
     this.familyStatus,
     this.familyNetWorth,
     this.familyIncome,
     this.agriCulturalLand,
  });

  factory FamilyInformation.fromJson(Map<String , dynamic> json) {
    // final json = jsonDecode(jsonString);
    return FamilyInformation(
      contactTo: json['contactTo'],
      contactPerson: json['contactPerson'],
      familyValue: json['familyValue'],
      familyType: json['familyType'],
      familyStatus: json['familyStatus'],
      familyNetWorth: json['familyNetWorth'],
      familyIncome: json['familyIncome'],
      agriCulturalLand: json['agriCulturalLand'],
    );
  }
}

class OtherQualification {
    String? qualification;
    String? collegeName;

    OtherQualification({
        this.qualification,
        this.collegeName,
    });

    factory OtherQualification.fromJson(Map<String , dynamic> json){
      return OtherQualification(
      qualification: json['qualification'],
      collegeName: json['collegeName'],


      );
    }

 
    String toJson() => json.encode(toMap());

    factory OtherQualification.fromMap(Map<String, dynamic> json) => OtherQualification(
        qualification: json["qualification"],
        collegeName: json["collegeName"],
    );

    Map<String, dynamic> toMap() => {
        "qualification": qualification,
        "collegeName": collegeName,
    };
}
