class GetFileRequestsModel {
  bool? status;
  List<Response>? response;

  GetFileRequestsModel({this.status, this.response});

  GetFileRequestsModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? isFree;
  String? createdAt;
  String? updatedAt;
  String? toUserName;
  String? toUserImage;

  Response(
      {this.id,
        this.groupId,
        this.name,
        this.isFree,
        this.createdAt,
        this.updatedAt,
        this.toUserName,
        this.toUserImage});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    name = json['name'];
    isFree = json['isFree'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    toUserName = json['to_user_name'];
    toUserImage = json['to_user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['group_id'] = groupId;
    data['name'] = name;
    data['isFree'] = isFree;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['to_user_name'] = toUserName;
    data['to_user_image'] = toUserImage;
    return data;
  }
}
