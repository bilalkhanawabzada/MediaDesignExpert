import 'dart:convert';

class UserProfile {
    String? message;
    User? user;

    UserProfile({
        this.message,
        this.user,
    });

    UserProfile copyWith({
        String? message,
        User? user,
    }) => 
        UserProfile(
            message: message ?? this.message,
            user: user ?? this.user,
        );

    factory UserProfile.fromJson(String str) => UserProfile.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        message: json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "user": user?.toMap(),
    };
}

class User {
    String? id;
    String? phoneNumber;
    dynamic otp;
    dynamic otpExpires;
    List<dynamic>? friends;
    bool? disable;
    String? rtmToken;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? token;
    String? dob;
    String? firstName;
    String? lastName;
    dynamic profilePicture;
    String? username;
    String? email;
    String? mailOtp;
    DateTime? mailOtpExpires;
    String? isVerfied;
    String? agoraData;

    User({
        this.id,
        this.phoneNumber,
        this.otp,
        this.otpExpires,
        this.friends,
        this.disable,
        this.rtmToken,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.token,
        this.dob,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.username,
        this.email,
        this.mailOtp,
        this.mailOtpExpires,
        this.isVerfied,
        this.agoraData,
    });

    User copyWith({
        String? id,
        String? phoneNumber,
        dynamic otp,
        dynamic otpExpires,
        List<dynamic>? friends,
        bool? disable,
        String? rtmToken,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
        String? token,
        String? dob,
        String? firstName,
        String? lastName,
        dynamic profilePicture,
        String? username,
        String? email,
        String? mailOtp,
        DateTime? mailOtpExpires,
        String? isVerfied,
        String? agoraData,
    }) => 
        User(
            id: id ?? this.id,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            otp: otp ?? this.otp,
            otpExpires: otpExpires ?? this.otpExpires,
            friends: friends ?? this.friends,
            disable: disable ?? this.disable,
            rtmToken: rtmToken ?? this.rtmToken,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
            token: token ?? this.token,
            dob: dob ?? this.dob,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            profilePicture: profilePicture ?? this.profilePicture,
            username: username ?? this.username,
            email: email ?? this.email,
            mailOtp: mailOtp ?? this.mailOtp,
            mailOtpExpires: mailOtpExpires ?? this.mailOtpExpires,
            isVerfied: isVerfied ?? this.isVerfied,
            agoraData: agoraData ?? this.agoraData,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        otp: json["otp"],
        otpExpires: json["otpExpires"],
        friends: json["friends"] == null ? [] : List<dynamic>.from(json["friends"]!.map((x) => x)),
        disable: json["disable"],
        rtmToken: json["rtmToken"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        dob: json["dob"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        username: json["username"],
        email: json["email"],
        mailOtp: json["mailOtp"],
        mailOtpExpires: json["mailOtpExpires"] == null ? null : DateTime.parse(json["mailOtpExpires"]),
        isVerfied: json["isVerfied"],
        agoraData: json["agoraData"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "phoneNumber": phoneNumber,
        "otp": otp,
        "otpExpires": otpExpires,
        "friends": friends == null ? [] : List<dynamic>.from(friends!.map((x) => x)),
        "disable": disable,
        "rtmToken": rtmToken,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
        "dob": dob,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "username": username,
        "email": email,
        "mailOtp": mailOtp,
        "mailOtpExpires": mailOtpExpires?.toIso8601String(),
        "isVerfied": isVerfied,
        "agoraData": agoraData,
    };
}
