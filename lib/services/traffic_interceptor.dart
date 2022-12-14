import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final acccessToken = 'pk.eyJ1IjoibWFydGlucGVsbGkiLCJhIjoiY2xjMHV2cG1xMWI3bjNubW4yYzJiem9oZSJ9.NdH1vpCzteJHcHrEC3YglA';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters
        .addAll({'alternatives': true, 'geometries': 'polyline6', 'overview': 'simplified', 'steps': false, 'access_token': acccessToken});
    super.onRequest(options, handler);
  }
}
