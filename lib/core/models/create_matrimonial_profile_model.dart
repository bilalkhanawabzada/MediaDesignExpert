import 'dart:convert';

class CreateMatrimonialProfileModel {
    String? id;
    UserId? userId;
    String? phoneNo;
    String? profileFor;
    String? firstName;
    String? lastName;
    String? dateOfBirth;
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
    List<dynamic>? hobbies;
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

    CreateMatrimonialProfileModel({
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
        this.hobbies,
        this.diet,
        this.height,
        this.income,
        this.motherTongue,
        this.education,
        this.otherQualification,
        this.career,
        this.intrests,
        this.religiousInformation,
        this.familyInformation,
    });

    factory CreateMatrimonialProfileModel.fromJson(String str) => CreateMatrimonialProfileModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CreateMatrimonialProfileModel.fromMap(Map<String, dynamic> json) => CreateMatrimonialProfileModel(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromMap(json["userId"]),
        phoneNo: json["phoneNo"],
        profileFor: json["profileFor"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
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
        hobbies: json["hobbies"] == null ? [] : List<dynamic>.from(json["hobbies"]!.map((x) => x)),
        diet: json["diet"],
        height: json["height"],
        income: json["income"],
        motherTongue: json["motherTongue"],
        education: json["education"] == null ? null : Education.fromMap(json["education"]),
        otherQualification: json["otherQualification"] == null ? null : OtherQualification.fromMap(json["otherQualification"]),
        career: json["career"] == null ? null : Career.fromMap(json["career"]),
        intrests: json["intrests"],
        religiousInformation: json["religiousInformation"] == null ? null : ReligiousInformation.fromMap(json["religiousInformation"]),
        familyInformation: json["familyInformation"] == null ? null : FamilyInformation.fromMap(json["familyInformation"]),
    );

    Map<String, dynamic> toMap() => {
    "_id": id,
    "userId": userId?.toMap(),
    "phoneNo": phoneNo,
    "profileFor": profileFor,
    "firstName": firstName,
    "lastName": lastName,
    "dateOfBirth" : dateOfBirth,
    // "dateOfBirth": dateOfBirth != null
    //     ? "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}"
    //     : null,
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
    "hobbies": hobbies == null ? [] : List<dynamic>.from(hobbies!.map((x) => x)),
    "diet": diet,
    "height": height,
    "income": income,
    "motherTongue": motherTongue,
    "education": education?.toMap(),
    "otherQualification": otherQualification?.toMap(),
    "career": career?.toMap(),
    "intrests": intrests,
    "religiousInformation": religiousInformation?.toMap(),
    "familyInformation": familyInformation?.toMap(),
};

}

class Career {
    String? areYouWorking;
    String? designation;
    String? employerName;
    String? income;

    Career({
        this.areYouWorking,
        this.designation,
        this.employerName,
        this.income,
    });

    factory Career.fromJson(String str) => Career.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Career.fromMap(Map<String, dynamic> json) => Career(
        areYouWorking: json["areYouWorking"],
        designation: json["designation"],
        employerName: json["employerName"],
        income: json["income"],
    );

    Map<String, dynamic> toMap() => {
        "areYouWorking": areYouWorking,
        "designation": designation,
        "employerName": employerName,
        "income": income,
    };
}

class Education {
    String? degree;
    String? fieldOfStudy;
    String? collegeName;
    String? graduationYear;

    Education({
        this.degree,
        this.fieldOfStudy,
        this.collegeName,
        this.graduationYear,
    });

    factory Education.fromJson(String str) => Education.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Education.fromMap(Map<String, dynamic> json) => Education(
        degree: json["degree"],
        fieldOfStudy: json["fieldOfStudy"],
        collegeName: json["collegeName"],
        graduationYear: json["graduationYear"],
    );

    Map<String, dynamic> toMap() => {
        "degree": degree,
        "fieldOfStudy": fieldOfStudy,
        "collegeName": collegeName,
        "graduationYear": graduationYear,
    };
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

    factory FamilyInformation.fromJson(String str) => FamilyInformation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FamilyInformation.fromMap(Map<String, dynamic> json) => FamilyInformation(
        contactTo: json["contactTo"],
        contactPerson: json["contactPerson"],
        familyValue: json["familyValue"],
        familyType: json["familyType"],
        familyStatus: json["familyStatus"],
        familyNetWorth: json["familyNetWorth"],
        familyIncome: json["familyIncome"],
        agriCulturalLand: json["agriCulturalLand"],
    );

    Map<String, dynamic> toMap() => {
        "contactTo": contactTo,
        "contactPerson": contactPerson,
        "familyValue": familyValue,
        "familyType": familyType,
        "familyStatus": familyStatus,
        "familyNetWorth": familyNetWorth,
        "familyIncome": familyIncome,
        "agriCulturalLand": agriCulturalLand,
    };
}

class OtherQualification {
    String? qualification;
    String? collegeName;

    OtherQualification({
        this.qualification,
        this.collegeName,
    });

    factory OtherQualification.fromJson(String str) => OtherQualification.fromMap(json.decode(str));

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

    factory ReligiousInformation.fromJson(String str) => ReligiousInformation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ReligiousInformation.fromMap(Map<String, dynamic> json) => ReligiousInformation(
        subcaste: json["subcaste"],
        star: json["star"],
        grandMotherGothra: json["grandMotherGothra"],
        motherSideGothra: json["motherSideGothra"],

        manglik: json["manglik"],
        timeOfBirth: json["timeOfBirth"],
        countryOfBirth: json["countryOfBirth"],
        stateOfBirth: json["stateOfBirth"],
        cityOfBirth: json["cityOfBirth"],
        raasi: json["raasi"],
    );

    Map<String, dynamic> toMap() => {
        "subcaste": subcaste,
        "star": star,
        "grandMotherGothra": grandMotherGothra,
        "motherSideGothra": motherSideGothra,

        "manglik": manglik,
        "timeOfBirth": timeOfBirth,
        "countryOfBirth": countryOfBirth,
        "stateOfBirth": stateOfBirth,
        "cityOfBirth": cityOfBirth,
        "raasi": raasi,
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
