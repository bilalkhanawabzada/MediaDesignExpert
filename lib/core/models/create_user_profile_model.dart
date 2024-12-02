import 'dart:convert';

class UserProfileModel {
    String token;
    String firstName;
    String lastName;
    String profilePicture;
    String username;
    String dob;

    UserProfileModel({
        required this.token,
        required this.firstName,
        required this.lastName,
        required this.profilePicture,
        required this.username,
        required this.dob,
    });

    factory UserProfileModel.fromJson(String str) => UserProfileModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserProfileModel.fromMap(Map<String, dynamic> json) => UserProfileModel(
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        username: json["username"],
        dob: json["dob"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "username": username,
        "dob" : dob,
    };
}
