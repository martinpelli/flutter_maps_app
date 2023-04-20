import 'package:dio/dio.dart';
import 'package:flutter_maps_app/constants/constants.dart';

class PlacesInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({'access_token': accessToken, 'language': 'es', 'limit': 7});
    super.onRequest(options, handler);
  }
}
