class UserOperationsModel {
  bool? status;
  List<Response>? response;

  UserOperationsModel({this.status, this.response});

  UserOperationsModel.fromJson(Map<String, dynamic> json) {
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
  Null? currentVersion;
  Null? comparisonResult;
  String? createdAt;
  String? updatedAt;
  File? file;

  Response(
      {this.id,
        this.userId,
        this.fileId,
        this.operation,
        this.currentVersion,
        this.comparisonResult,
        this.createdAt,
        this.updatedAt,
        this.file});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fileId = json['file_id'];
    operation = json['operation'];
    currentVersion = json['current_version'];
    comparisonResult = json['comparison_result'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    file = json['file'] != null ? File.fromJson(json['file']) : null;
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
    if (file != null) {
      data['file'] = file!.toJson();
    }
    return data;
  }
}

class File {
  int? id;
  String? name;

  File({this.id, this.name});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
