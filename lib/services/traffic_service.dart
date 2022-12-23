import 'package:dio/dio.dart';
import 'package:flutter_maps_app/services/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';

class TrafficService {
  final Dio _dioTraffic;

  final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  TrafficService() : _dioTraffic = Dio()..interceptors.add(TrafficInterceptor());

  Future getCoorsStartToEnd(LatLng start, LatLng end) async {
    final coorsString = '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$_baseTrafficUrl/driving/$coorsString';

    final trafficResponse = await _dioTraffic.get(url);

    final data = TrafficResponse.fromMap(trafficResponse.data);

    return data;
  }
}
