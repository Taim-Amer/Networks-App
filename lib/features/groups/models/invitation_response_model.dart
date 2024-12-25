class InvitationResponseModel {
  bool? status;
  String? response;

  InvitationResponseModel({this.status, this.response});

  InvitationResponseModel.fromJson(Map<String, dynamic> json) {
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
