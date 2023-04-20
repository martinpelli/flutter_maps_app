import 'package:dio/dio.dart';
import 'package:flutter_maps_app/constants/constants.dart';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters
        .addAll({'alternatives': true, 'geometries': 'polyline6', 'overview': 'simplified', 'steps': false, 'access_token': accessToken});
    super.onRequest(options, handler);
  }
}
