class GroupInvitationResponse {
  bool? status;
  String? message;

  GroupInvitationResponse({this.status, this.message});

  // Factory constructor for creating a new GroupInvitationResponse instance from a map.
  factory GroupInvitationResponse.fromJson(Map<String, dynamic> json) {
    return GroupInvitationResponse(
      status: json['status'],
      message: json['message'],
    );
  }

  // Method to convert GroupInvitationResponse instance to a map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
