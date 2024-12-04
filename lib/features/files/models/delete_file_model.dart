class DeleteFileModel {
  bool? status;
  String? response;

  DeleteFileModel({this.status, this.response});

  DeleteFileModel.fromJson(Map<String, dynamic> json) {
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
