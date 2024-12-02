// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jaat_app/core/models/getall_user_model.dart';

class UserStatusModel {
  String? uri;
  int? timestamp;
  List<Entities>? entities;
  int? count;
  String? action;
  UserStatusData? data;
  int? duration;

  UserStatusModel(
      {this.uri,
      this.timestamp,
      this.entities,
      this.count,
      this.action,
      this.data,
      this.duration});

  UserStatusModel.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    timestamp = json['timestamp'];
    if (json['entities'] != null) {
      entities = <Entities>[];
      json['entities'].forEach((v) {
        entities!.add(Entities.fromJson(v));
      });
    }
    count = json['count'];
    action = json['action'];
    data =
        json['data'] != null ? UserStatusData.fromJson(json['data']) : null;
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uri'] = uri;
    data['timestamp'] = timestamp;
    if (entities != null) {
      data['entities'] = entities!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['action'] = action;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['duration'] = duration;
    return data;
  }
}

class UserStatusData {
  String? user1;

  UserStatusData({this.user1 = ''});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user1': user1,
    };
  }

  UserStatusData.fromJson(Map<String, dynamic> json) {
    user1 = json['user1'] ?? '';
  }
}
