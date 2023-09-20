// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    String? id;
    String? email;
    String? username;
    bool? isActive;
    String? refreshedToken;

    Users({
         this.id,
         this.email,
         this.username,
         this.isActive,
         this.refreshedToken,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        isActive: json["is_active"],
        refreshedToken: json["refreshed_token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "is_active": isActive,
        "refreshed_token": refreshedToken,
    };
}
