import 'dart:convert';

class MatrixResponse {
  MatrixResponse({
    required this.code,
    required this.distances,
    required this.destinations,
    required this.sources,
  });

  final String code;
  final List<List<double>> distances;
  final List<Destination> destinations;
  final List<Destination> sources;

  factory MatrixResponse.fromJson(String str) => MatrixResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatrixResponse.fromMap(Map<String, dynamic> json) => MatrixResponse(
        code: json["code"],
        distances: List<List<double>>.from(json["distances"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        destinations: List<Destination>.from(json["destinations"].map((x) => Destination.fromMap(x))),
        sources: List<Destination>.from(json["sources"].map((x) => Destination.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "distances": List<dynamic>.from(distances.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "destinations": List<dynamic>.from(destinations.map((x) => x.toMap())),
        "sources": List<dynamic>.from(sources.map((x) => x.toMap())),
      };
}

class Destination {
  Destination({
    required this.distance,
    required this.name,
    required this.location,
  });

  final double distance;
  final String name;
  final List<double> location;

  factory Destination.fromJson(String str) => Destination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Destination.fromMap(Map<String, dynamic> json) => Destination(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}
