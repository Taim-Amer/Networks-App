class FileVersionsModel {
  bool? status;
  int? response;

  FileVersionsModel({this.status, this.response});

  FileVersionsModel.fromJson(Map<String, dynamic> json) {
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
