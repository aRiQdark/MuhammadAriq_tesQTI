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
    List<assetResult> results;

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
        results: List<assetResult>.from(json["results"].map((x) => assetResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "page_count": pageCount,
        "page_size": pageSize,
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class assetResult {
    String id;
    String name;

    assetResult({
        required this.id,
        required this.name,
    });

    factory assetResult.fromJson(Map<String, dynamic> json) => assetResult(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
