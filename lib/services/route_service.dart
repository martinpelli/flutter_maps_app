import 'package:dio/dio.dart';
import 'package:flutter_maps_app/models/models.dart';

class RouteService {
  static final Dio _dio = Dio(BaseOptions(contentType: Headers.jsonContentType));

  static const String _baseUrl = 'http://192.168.1.44:8000';

  static Future<RouteResponse> getRoute(RouteRequest routeRequest) async {
    const url = '$_baseUrl/resolve';

    final routeResponse = await _dio.post(url, data: routeRequest.toMap());

    return RouteResponse.fromMap(routeResponse.data);
  }
}
