class CreateGroup {
  bool? status;
  String? response;

  CreateGroup({this.status, this.response});

  // Factory constructor for creating a new ApiResponse instance from a map.
  factory CreateGroup.fromJson(Map<String, dynamic> json) {
    return CreateGroup(
      status: json['status'],
      response: json['response'],
    );
  }

  // Method to convert ApiResponse instance to a map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['response'] = this.response;
    return data;
  }
}
