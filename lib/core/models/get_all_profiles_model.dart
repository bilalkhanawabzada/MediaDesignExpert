import 'dart:convert';

class AllProfilesModel {
  String? profileId;
  String? userId;
  List<dynamic>? profilePicture;
  String? firstName;
  String? lastName;
  bool? sendRequest;
  String? profileFor;
  String? userFirstName;
  String? userLastName;
  String? userProfilePicture;



  AllProfilesModel({
    this.profileId,
    this.userId,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.sendRequest,
    this.profileFor,
    this.userFirstName,
    this.userLastName,
    this.userProfilePicture
  });

  factory AllProfilesModel.fromJson(String str) => AllProfilesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllProfilesModel.fromMap(Map<String, dynamic> json) => AllProfilesModel(
        profileId: json["profileId"],
        userId: json["userId"],
        profileFor: json["profileFor"],
        profilePicture: (json["profilePicture"] == null || json["profilePicture"] == []) ? [] : List<String>.from(json["profilePicture"]!.map((x) => x)),
        firstName: json["firstName"],
        lastName: json["lastName"],
        sendRequest: json["sendRequest"],
        userFirstName: json["userFirstName"],
        userLastName: json["userLastName"],
        userProfilePicture: json["userProfilePicture"],
      );

  Map<String, dynamic> toMap() => {
        "profileId": profileId,
        "profileFor": profileFor,
        "userId": userId,
        "profilePicture": profilePicture == null ? [] : List<String>.from(profilePicture!.map((x) => x)),
        "firstName": firstName,
        "lastName": lastName,
        "sendRequest": sendRequest,
        "userFirstName": userFirstName,
        "userLastName": userLastName,
        "userProfilePicture": userProfilePicture,
      };
}


// import 'dart:convert';

// class AllProfilesModel {
//     String? id;
//     String? userId;
//     String? profileFor;
//     String? firstName;
//     String? lastName;
//     DateTime? dateOfBirth;
//     String? about;
//     List<dynamic>? profilePicture;
//     String? gender;
//     bool? showGender;
//     String? email;
//     String? country;
//     String? state;
//     String? city;
//     String? citizenship;
//     String? residence;
//     String? livingWith;
//     String? martialStatus;
//     String? diet;
//     String? height;
//     String? income;
//     String? motherTongue;
//     Education? education;
//     String? career;
//     String? intrests;
//     String? religiousInformation;
//     String? familyInformation;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;

//     AllProfilesModel({
//         this.id,
//         this.userId,
//         this.profileFor,
//         this.firstName,
//         this.lastName,
//         this.dateOfBirth,
//         this.about,
//         this.profilePicture,
//         this.gender,
//         this.showGender,
//         this.email,
//         this.country,
//         this.state,
//         this.city,
//         this.citizenship,
//         this.residence,
//         this.livingWith,
//         this.martialStatus,
//         this.diet,
//         this.height,
//         this.income,
//         this.motherTongue,
//         this.education,
//         this.career,
//         this.intrests,
//         this.religiousInformation,
//         this.familyInformation,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     factory AllProfilesModel.fromJson(String str) => AllProfilesModel.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory AllProfilesModel.fromMap(Map<String, dynamic> json) => AllProfilesModel(
//         id: json["_id"],
//         userId: json["userId"],
//         profileFor: json["profileFor"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
//         about: json["about"],
//         profilePicture: json["profilePicture"] == null ? [] : List<dynamic>.from(json["profilePicture"]!.map((x) => x)),
//         gender: json["gender"],
//         showGender: json["showGender"],
//         email: json["email"],
//         country: json["country"],
//         state: json["state"],
//         city: json["city"],
//         citizenship: json["citizenship"],
//         residence: json["residence"],
//         livingWith: json["livingWith"],
//         martialStatus: json["martialStatus"],
//         diet: json["diet"],
//         height: json["height"],
//         income: json["income"],
//         motherTongue: json["motherTongue"],
//         education: json["education"] == null ? null : Education.fromMap(json["education"]),
//         career: json["career"],
//         intrests: json["intrests"],
//         religiousInformation: json["religiousInformation"],
//         familyInformation: json["familyInformation"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "userId": userId,
//         "profileFor": profileFor,
//         "firstName": firstName,
//         "lastName": lastName,
//         "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
//         "about": about,
//         "profilePicture": profilePicture == null ? [] : List<dynamic>.from(profilePicture!.map((x) => x)),
//         "gender": gender,
//         "showGender": showGender,
//         "email": email,
//         "country": country,
//         "state": state,
//         "city": city,
//         "citizenship": citizenship,
//         "residence": residence,
//         "livingWith": livingWith,
//         "martialStatus": martialStatus,
//         "diet": diet,
//         "height": height,
//         "income": income,
//         "motherTongue": motherTongue,
//         "education": education?.toMap(),
//         "career": career,
//         "intrests": intrests,
//         "religiousInformation": religiousInformation,
//         "familyInformation": familyInformation,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//     };
// }

// class Education {
//     String? degree;
//     String? fieldOfStudy;
//     String? collegeName;
//     String? email;
//     String? graduationYear;

//     Education({
//         this.degree,
//         this.fieldOfStudy,
//         this.collegeName,
//         this.email,
//         this.graduationYear,
//     });

//     factory Education.fromJson(String str) => Education.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Education.fromMap(Map<String, dynamic> json) => Education(
//         degree: json["degree"],
//         fieldOfStudy: json["fieldOfStudy"],
//         collegeName: json["collegeName"],
//         email: json["email"],
//         graduationYear: json["graduationYear"],
//     );

//     Map<String, dynamic> toMap() => {
//         "degree": degree,
//         "fieldOfStudy": fieldOfStudy,
//         "collegeName": collegeName,
//         "email": email,
//         "graduationYear": graduationYear,
//     };
// }
