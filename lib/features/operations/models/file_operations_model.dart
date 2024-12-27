class FileOperationsModel {
  bool? status;
  List<Response>? response;

  FileOperationsModel({this.status, this.response});

  FileOperationsModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? fileId;
  String? operation;
  int? currentVersion;
  String? comparisonResult;
  String? createdAt;
  String? updatedAt;
  User? user;

  Response(
      {this.id,
        this.userId,
        this.fileId,
        this.operation,
        this.currentVersion,
        this.comparisonResult,
        this.createdAt,
        this.updatedAt,
        this.user});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fileId = json['file_id'];
    operation = json['operation'];
    currentVersion = json['current_version'];
    comparisonResult = json['comparison_result'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['file_id'] = fileId;
    data['operation'] = operation;
    data['current_version'] = currentVersion;
    data['comparison_result'] = comparisonResult;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
