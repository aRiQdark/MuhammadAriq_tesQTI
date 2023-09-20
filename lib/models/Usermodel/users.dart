// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
    String id;
    String email;
    String username;
    bool isActive;
    String token;

    UsersModel({
        required this.id,
        required this.email,
        required this.username,
        required this.isActive,
        required this.token,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        isActive: json["is_active"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "is_active": isActive,
        "token": token,
    };
}
