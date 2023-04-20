import 'dart:convert';

class RouteRequest {
  RouteRequest({
    required this.matrizDistancia,
    required this.cantVehiculos,
  });

  final List<List<int>> matrizDistancia;
  final int cantVehiculos;

  factory RouteRequest.fromJson(String str) => RouteRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RouteRequest.fromMap(Map<String, dynamic> json) => RouteRequest(
        matrizDistancia: List<List<int>>.from(json["matriz_distancia"].map((x) => List<int>.from(x.map((x) => x)))),
        cantVehiculos: json["cant_vehiculos"],
      );

  Map<String, dynamic> toMap() => {
        "matriz_distancia": List<dynamic>.from(matrizDistancia.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "cant_vehiculos": cantVehiculos,
      };
}
