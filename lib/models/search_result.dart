import 'package:mapbox_gl/mapbox_gl.dart';

class SearchResult {
  final bool cancel;
  final bool manual;
  final LatLng? position;
  final String? name;
  final String? description;

  SearchResult({required this.cancel, this.manual = false, this.position, this.name, this.description});
}
