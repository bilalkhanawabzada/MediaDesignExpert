// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  final String message;
  final String token;
  final String userId;
  final String profileId;

  VerifyOtpModel({
    required this.message,
    required this.token,
    required this.userId,
    required this.profileId,
  });

  VerifyOtpModel copyWith({
    String? message,
    String? token,
    String? userId,
    String? profileId,
  }) =>
      VerifyOtpModel(
        message: message ?? this.message,
        token: token ?? this.token,
        userId: userId ?? this.userId,
        profileId: profileId ?? this.profileId,
      );

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        message: json["message"],
        token: json["token"],
        userId: json["userId"],
        profileId: json.containsKey('profileId') ? json["profileId"] : '',
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "userId": userId,
        "profileId": profileId,
      };
}
