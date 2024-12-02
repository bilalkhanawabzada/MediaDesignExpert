import 'dart:convert';

class ProfileByIdModel {
    Profile? profile;
    dynamic message;

    ProfileByIdModel({
        this.profile,
        this.message,
    });

    factory ProfileByIdModel.fromJson(String str) => ProfileByIdModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileByIdModel.fromMap(Map<String, dynamic> json) => ProfileByIdModel(
        profile: json["profile"] == null ? null : Profile.fromMap(json["profile"]),
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "profile": profile?.toMap(),
        "message": message,
    };
}

class Profile {
    String? id;
    UserId? userId;
    String? profileFor;
    String? firstName;
    String? lastName;
    DateTime? dateOfBirth;
    String? about;
    List<dynamic>? profilePicture;
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
    String? career;
    String? intrests;
    String? religiousInformation;
    String? familyInformation;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Profile({
        this.id,
        this.userId,
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
        this.education,
        this.career,
        this.intrests,
        this.religiousInformation,
        this.familyInformation,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromMap(json["userId"]),
        profileFor: json["profileFor"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        about: json["about"],
        profilePicture: json["profilePicture"] == null ? [] : List<dynamic>.from(json["profilePicture"]!.map((x) => x)),
        gender: json["gender"],
        showGender: json["showGender"],
        email: json["email"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        citizenship: json["citizenship"],
        residence: json["residence"],
        livingWith: json["livingWith"],
        martialStatus: json["martialStatus"],
        diet: json["diet"],
        height: json["height"],
        income: json["income"],
        motherTongue: json["motherTongue"],
        education: json["education"] == null ? null : Education.fromMap(json["education"]),
        career: json["career"],
        intrests: json["intrests"],
        religiousInformation: json["religiousInformation"],
        familyInformation: json["familyInformation"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "userId": userId?.toMap(),
        "profileFor": profileFor,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
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
        "education": education?.toMap(),
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

    factory Education.fromJson(String str) => Education.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Education.fromMap(Map<String, dynamic> json) => Education(
        degree: json["degree"],
        fieldOfStudy: json["fieldOfStudy"],
        collegeName: json["collegeName"],
        email: json["email"],
        graduationYear: json["graduationYear"],
    );

    Map<String, dynamic> toMap() => {
        "degree": degree,
        "fieldOfStudy": fieldOfStudy,
        "collegeName": collegeName,
        "email": email,
        "graduationYear": graduationYear,
    };
}

class UserId {
    String? id;
    String? firstName;
    String? lastName;

    UserId({
        this.id,
        this.firstName,
        this.lastName,
    });

    factory UserId.fromJson(String str) => UserId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserId.fromMap(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
    };
}
