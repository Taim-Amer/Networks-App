class GetGroupInvitationModel {
  bool? status;
  List<Response>? response;

  GetGroupInvitationModel({this.status, this.response});

  GetGroupInvitationModel.fromJson(Map<String, dynamic> json) {
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
  int? groupId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Group? group;

  Response(
      {this.id,
        this.groupId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.group});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['group_id'] = groupId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (group != null) {
      data['group'] = group!.toJson();
    }
    return data;
  }
}

class Group {
  int? id;
  String? name;
  bool? isOwner;

  Group({this.id, this.name, this.isOwner});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isOwner = json['is_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_owner'] = isOwner;
    return data;
  }
}
