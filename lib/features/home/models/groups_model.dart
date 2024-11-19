import 'dart:convert';

GroupsModel responseFromJson(String str) => GroupsModel.fromJson(json.decode(str));
String responseToJson(GroupsModel data) => json.encode(data.toJson());

class GroupsModel {
    bool? status;
    List<Group>? response;

    GroupsModel({
        this.status,
        this.response,
    });

    factory GroupsModel.fromJson(Map<String, dynamic> json) => GroupsModel(
        status: json["status"],
        response: List<Group>.from(json["response"].map((x) => Group.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class Group {
    int? id;
    String? name;
    int? userId;
    bool? isOwner;  // Added is_owner field
    Pivot? pivot;
    User? user;

    Group({
        this.id,
        this.name,
        this.userId,
        this.isOwner,  // Initialize is_owner
        this.pivot,
        this.user,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        isOwner: json["is_owner"],  // Deserialize is_owner from JSON
        pivot: Pivot.fromJson(json["pivot"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "is_owner": isOwner,  // Serialize is_owner to JSON
        "pivot": pivot?.toJson(),
        "user": user?.toJson(),
    };
}

class Pivot {
    int? userId;
    int? groupId;

    Pivot({
        this.userId,
        this.groupId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        groupId: json["group_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "group_id": groupId,
    };
}

class User {
    int? id;
    String? email;
    String? name;

    User({
        this.id,
        this.email,
        this.name,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
    };
}
