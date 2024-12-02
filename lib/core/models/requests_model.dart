// To parse this JSON data, do
//
//     final requestsModel = requestsModelFromJson(jsonString);

import 'dart:convert';

List<RequestsModel> requestsModelFromJson(String str) => List<RequestsModel>.from(json.decode(str).map((x) => RequestsModel.fromJson(x)));

String requestsModelToJson(List<RequestsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestsModel {
  String? id;
  Sender? sender;
  String? receiver;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RequestsModel({
    this.id,
    this.sender,
    this.receiver,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RequestsModel.fromJson(Map<String, dynamic> json) => RequestsModel(
        id: json["_id"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        receiver: json["receiver"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender?.toJson(),
        "receiver": receiver,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}


class Sender {
  String? id;
  String? phoneNumber;
  dynamic otp;
  dynamic otpExpires;
  List<dynamic>? friends;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  String? dob;
  String? firstName;
  String? lastName;
  List<String>? profilePicture; // Updated to List<String>
  String? username;
  AgoraData? agoraData;

  Sender({
    this.id,
    this.phoneNumber,
    this.otp,
    this.otpExpires,
    this.friends,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.dob,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.username,
    this.agoraData,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        otp: json["otp"],
        otpExpires: json["otpExpires"],
        friends: json["friends"] == null ? [] : List<dynamic>.from(json["friends"]!.map((x) => x)),
        disable: json["disable"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        dob: json["dob"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"] == null
            ? []
            : List<String>.from(json["profilePicture"]!.map((x) => x.toString())), // Convert to List<String>
        username: json["username"],
        agoraData: json["agoraData"] == null ? null : AgoraData.fromJson(json["agoraData"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phoneNumber": phoneNumber,
        "otp": otp,
        "otpExpires": otpExpires,
        "friends": friends == null ? [] : List<dynamic>.from(friends!.map((x) => x)),
        "disable": disable,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
        "dob": dob,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture == null
            ? []
            : List<dynamic>.from(profilePicture!.map((x) => x)), // Convert back to dynamic list for JSON
        "username": username,
        "agoraData": agoraData?.toJson(),
      };
}


// class Sender {
//   String? id;
//   String? phoneNumber;
//   dynamic otp;
//   dynamic otpExpires;
//   List<dynamic>? friends;
//   bool? disable;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? token;
//   String? dob;
//   String? firstName;
//   String? lastName;
//   String? profilePicture;
//   String? username;
//   AgoraData? agoraData;

// //   Sender({
// //     this.id,
// //     this.phoneNumber,
// //     this.otp,
// //     this.otpExpires,
// //     this.friends,
// //     this.disable,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.v,
// //     this.token,
// //     this.dob,
// //     this.firstName,
// //     this.lastName,
// //     this.profilePicture,
// //     this.username,
// //     this.agoraData,
// //   });

// //   factory Sender.fromJson(Map<String, dynamic> json) => Sender(
// //         id: json["_id"],
// //         phoneNumber: json["phoneNumber"],
// //         otp: json["otp"],
// //         otpExpires: json["otpExpires"],
// //         friends: json["friends"] == null ? [] : List<dynamic>.from(json["friends"]!.map((x) => x)),
// //         disable: json["disable"],
// //         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
// //         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
// //         v: json["__v"],
// //         token: json["token"],
// //         dob: json["dob"],
// //         firstName: json["firstName"],
// //         lastName: json["lastName"],
// //         profilePicture: json["profilePicture"],
// //         username: json["username"],
// //         agoraData: json["agoraData"] == null ? null : AgoraData.fromJson(json["agoraData"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "_id": id,
// //         "phoneNumber": phoneNumber,
// //         "otp": otp,
// //         "otpExpires": otpExpires,
// //         "friends": friends == null ? [] : List<dynamic>.from(friends!.map((x) => x)),
// //         "disable": disable,
// //         "createdAt": createdAt?.toIso8601String(),
// //         "updatedAt": updatedAt?.toIso8601String(),
// //         "__v": v,
// //         "token": token,
// //         "dob": dob,
// //         "firstName": firstName,
// //         "lastName": lastName,
// //         "profilePicture": profilePicture,
// //         "username": username,
// //         "agoraData": agoraData?.toJson(),
// //       };
// // }

class AgoraData {
  String? path;
  String? uri;
  int? timestamp;
  String? organization;
  String? application;
  List<Entity>? entities;
  String? action;
  List<dynamic>? data;
  int? duration;
  String? applicationName;

  AgoraData({
    this.path,
    this.uri,
    this.timestamp,
    this.organization,
    this.application,
    this.entities,
    this.action,
    this.data,
    this.duration,
    this.applicationName,
  });

  factory AgoraData.fromJson(Map<String, dynamic> json) => AgoraData(
        path: json["path"],
        uri: json["uri"],
        timestamp: json["timestamp"],
        organization: json["organization"],
        application: json["application"],
        entities: json["entities"] == null ? [] : List<Entity>.from(json["entities"]!.map((x) => Entity.fromJson(x))),
        action: json["action"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        duration: json["duration"],
        applicationName: json["applicationName"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "uri": uri,
        "timestamp": timestamp,
        "organization": organization,
        "application": application,
        "entities": entities == null ? [] : List<dynamic>.from(entities!.map((x) => x.toJson())),
        "action": action,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "duration": duration,
        "applicationName": applicationName,
      };
}

class Entity {
  String? uuid;
  String? type;
  int? created;
  int? modified;
  String? username;
  bool? activated;

  Entity({
    this.uuid,
    this.type,
    this.created,
    this.modified,
    this.username,
    this.activated,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        uuid: json["uuid"],
        type: json["type"],
        created: json["created"],
        modified: json["modified"],
        username: json["username"],
        activated: json["activated"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "type": type,
        "created": created,
        "modified": modified,
        "username": username,
        "activated": activated,
      };
}
