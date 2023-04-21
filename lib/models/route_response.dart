import 'dart:convert';

class RouteResponse {
  RouteResponse({
    required this.rutasVehiculos,
    required this.distanciaTotal,
    required this.distanciaRutas,
  });

  final List<List<int>> rutasVehiculos;
  final double distanciaTotal;
  final List<int> distanciaRutas;

  factory RouteResponse.fromJson(String str) => RouteResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RouteResponse.fromMap(Map<String, dynamic> json) => RouteResponse(
        rutasVehiculos: List<List<int>>.from(json["rutasVehiculos"].map((x) => List<int>.from(x.map((x) => x)))),
        distanciaTotal: json["distanciaTotal"],
        distanciaRutas: List<int>.from(json["distanciaRutas"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "rutasVehiculos": List<dynamic>.from(rutasVehiculos.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "distanciaTotal": distanciaTotal,
        "distanciaRutas": List<dynamic>.from(distanciaRutas.map((x) => x)),
      };
}
