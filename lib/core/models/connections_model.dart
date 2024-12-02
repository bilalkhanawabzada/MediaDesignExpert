import 'dart:convert';

class ConnectionModel {
    String? id;
    String? firstName;
    String? lastName;
    String? profilePicture;
    String? username;

    ConnectionModel({
        this.id,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.username,
    });

    factory ConnectionModel.fromJson(String str) => ConnectionModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ConnectionModel.fromMap(Map<dynamic, dynamic> json) => ConnectionModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        username: json["username"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "username": username,
    };
}
