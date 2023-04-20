import 'package:dio/dio.dart';
import 'package:flutter_maps_app/constants/constants.dart';
import 'package:flutter_maps_app/models/models.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MatrixService {
  static final Dio _dio = Dio();

  static const String _baseUrl = 'https://api.mapbox.com/directions-matrix/v1/mapbox';

  static Future<MatrixResponse> getDistanceMatrix(List<LatLng> coords) async {
    final String coorsString = coords.fold('', (previousValue, element) => '$previousValue${element.longitude},${element.latitude};');

    final url = '$_baseUrl/driving/${coorsString.substring(0, coorsString.length - 1)}';

    final Map<String, dynamic> queryParameters = {"access_token": accessToken, "annotations": "distance"};

    final matrixResponse = await _dio.get(url, queryParameters: queryParameters);

    return MatrixResponse.fromMap(matrixResponse.data);
  }
}
