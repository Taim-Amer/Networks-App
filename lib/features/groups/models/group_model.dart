class GroupModel {
  bool? status;
  List<Response>? response;

  GroupModel({this.status, this.response});

  GroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  int? id;
  String? name;
  int? userId;
  bool? isOwner;
  Pivot? pivot;
  User? user;

  Response(
      {this.id, this.name, this.userId, this.isOwner, this.pivot, this.user});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    isOwner = json['is_owner'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_id'] = userId;
    data['is_owner'] = isOwner;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? groupId;

  Pivot({this.userId, this.groupId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['group_id'] = groupId;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? name;

  User({this.id, this.email, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}
