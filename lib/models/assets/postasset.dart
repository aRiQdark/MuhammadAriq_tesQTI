// To parse this JSON data, do
//
//     final postassets = postassetsFromJson(jsonString);

import 'dart:convert';

Postassets postassetsFromJson(String str) => Postassets.fromJson(json.decode(str));

String postassetsToJson(Postassets data) => json.encode(data.toJson());

class Postassets {
    String id;
    String name;
    String locationId;
    String statusId;

    Postassets({
        required this.id,
        required this.name,
        required this.locationId,
        required this.statusId,
    });

    factory Postassets.fromJson(Map<String, dynamic> json) => Postassets(
        id: json["id"],
        name: json["name"],
        locationId: json["location_id"],
        statusId: json["status_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location_id": locationId,
        "status_id": statusId,
    };
}
