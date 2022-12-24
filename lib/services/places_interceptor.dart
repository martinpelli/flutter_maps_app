import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final acccessToken = 'pk.eyJ1IjoibWFydGlucGVsbGkiLCJhIjoiY2xjMHV2cG1xMWI3bjNubW4yYzJiem9oZSJ9.NdH1vpCzteJHcHrEC3YglA';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({'access_token': acccessToken, 'language': 'es', 'limit': 7});
    super.onRequest(options, handler);
  }
}
