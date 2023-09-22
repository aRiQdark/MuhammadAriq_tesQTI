// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    List<Result> results;

    Location({
        required this.results,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    LocationClass? location;
    int? count;

    Result({
         this.location,
         this.count,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        location: LocationClass.fromJson(json["location"]),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "count": count,
    };
}

class LocationClass {
    String id;
    String name;

    LocationClass({
        required this.id,
        required this.name,
    });

    factory LocationClass.fromJson(Map<String, dynamic> json) => LocationClass(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
