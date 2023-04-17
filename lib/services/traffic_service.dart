import 'package:dio/dio.dart';
import 'package:flutter_maps_app/services/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../models/models.dart';

class TrafficService {
  final Dio _dioTraffic;
  final Dio _dioPlaces;

  final String _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final String _basePlacesUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

  TrafficService()
      : _dioTraffic = Dio()..interceptors.add(TrafficInterceptor()),
        _dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

  Future getCoorsStartToEnd(LatLng start, LatLng end) async {
    final coorsString = '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$_baseTrafficUrl/driving/$coorsString';

    final trafficResponse = await _dioTraffic.get(url);

    final data = TrafficResponse.fromMap(trafficResponse.data);

    return data;
  }

  Future<List<Feature>> getResultsByQuery(LatLng proximity, String query) async {
    if (query.isEmpty) return const [];

    final url = '$_basePlacesUrl/$query.json';

    final response = await _dioPlaces.get(url, queryParameters: {'proximity': '${proximity.longitude},${proximity.latitude}'});

    final placesResponse = PlacesResponse.fromMap(response.data);

    return placesResponse.features;
  }
}
