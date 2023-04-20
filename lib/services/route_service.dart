import 'package:dio/dio.dart';
import 'package:flutter_maps_app/models/models.dart';

class RouteService {
  static final Dio _dio = Dio();

  static const String _baseUrl = 'http://localhost:8000';

  static Future<RouteResponse> getRoute(RouteRequest routeRequest) async {
    const url = '$_baseUrl/resolve';

    final routeResponse = await _dio.post(url, data: routeRequest.toMap());

    return RouteResponse.fromMap(routeResponse.data);
  }
}
