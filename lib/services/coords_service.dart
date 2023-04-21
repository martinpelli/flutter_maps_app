import 'package:dio/dio.dart';
import 'package:flutter_maps_app/constants/constants.dart';
import 'package:flutter_maps_app/models/models.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class CoordsService {
  static final Dio _dio = Dio();

  static const String _baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  static Future<CoordsResponse> getCoordsOfRoute(List<LatLng> coords) async {
    final String coorsString = coords.fold('', (previousValue, element) => '$previousValue${element.longitude},${element.latitude};');

    final url = '$_baseUrl/driving/${coorsString.substring(0, coorsString.length - 1)}';

    final Map<String, dynamic> queryParameters = {"access_token": accessToken, "geometries": "geojson"};

    final coordsResponse = await _dio.get(url, queryParameters: queryParameters);

    return CoordsResponse.fromMap(coordsResponse.data);
  }
}
