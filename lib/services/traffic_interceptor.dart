import 'package:dio/dio.dart';

const acccessToken = 'pk.eyJ1IjoibWFydGlucGVsbGkiLCJhIjoiY2xjMHV2cG1xMWI3bjNubW4yYzJiem9oZSJ9.NdH1vpCzteJHcHrEC3YglA';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters
        .addAll({'alternatives': true, 'geometries': 'polyline6', 'overview': 'simplified', 'steps': false, 'access_token': acccessToken});
    super.onRequest(options, handler);
  }
}
