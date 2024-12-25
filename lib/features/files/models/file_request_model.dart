class FileRequestModel {
  bool? status;
  String? response;

  FileRequestModel({this.status, this.response});

  FileRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['response'] = response;
    return data;
  }
}
