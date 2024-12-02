class GetAllUserModel {
  String? path;
  String? uri;
  int? timestamp;
  List<Entities>? entities;
  int? count;
  String? action;
  int? duration;

  GetAllUserModel(
      {this.path,
      this.uri,
      this.timestamp,
      this.entities,
      this.count,
      this.action,
      this.duration});

  GetAllUserModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
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
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['uri'] = uri;
    data['timestamp'] = timestamp;
    if (entities != null) {
      data['entities'] = entities!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['action'] = action;
    data['duration'] = duration;
    return data;
  }
}

class Entities {
  String? uuid;
  String? type;
  int? created;
  int? modified;
  String? username;
  bool? activated;

  Entities(
      {this.uuid,
      this.type,
      this.created,
      this.modified,
      this.username,
      this.activated});

  Entities.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    created = json['created'];
    modified = json['modified'];
    username = json['username'];
    activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['type'] = type;
    data['created'] = created;
    data['modified'] = modified;
    data['username'] = username;
    data['activated'] = activated;
    return data;
  }
}
