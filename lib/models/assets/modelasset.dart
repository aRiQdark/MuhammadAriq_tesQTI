// To parse this JSON data, do
//
//     final asstes = asstesFromJson(jsonString);

import 'dart:convert';

Asstes asstesFromJson(String str) => Asstes.fromJson(json.decode(str));

String asstesToJson(Asstes data) => json.encode(data.toJson());

class Asstes {
    int count;
    int pageCount;
    int pageSize;
    int page;
    List<Result> results;

    Asstes({
        required this.count,
        required this.pageCount,
        required this.pageSize,
        required this.page,
        required this.results,
    });

    factory Asstes.fromJson(Map<String, dynamic> json) => Asstes(
        count: json["count"],
        pageCount: json["page_count"],
        pageSize: json["page_size"],
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "page_count": pageCount,
        "page_size": pageSize,
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String id;
    String name;

    Result({
        required this.id,
        required this.name,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
