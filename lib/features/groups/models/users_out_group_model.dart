

class UsersOutGroupModel {
  bool? status;
  List<User>? response;

  UsersOutGroupModel({this.status, this.response});

  factory UsersOutGroupModel.fromJson(Map<String, dynamic> json) => UsersOutGroupModel(
    status: json['status'],
    response: List<User>.from(json['response'].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'response': List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class User {
  int? id;
  String? email;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.email,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    name: json['name'],
    image: json['image'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'image': image,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
