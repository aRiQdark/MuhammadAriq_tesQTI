// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
    List<Result> results;

    Status({
        required this.results,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    StatusClass? status;
    int? count;

    Result({
         this.status,
         this.count,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: StatusClass.fromJson(json["status"]),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "count": count,
    };
}

class StatusClass {
    String id;
    String name;

    StatusClass({
        required this.id,
        required this.name,
    });

    factory StatusClass.fromJson(Map<String, dynamic> json) => StatusClass(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
