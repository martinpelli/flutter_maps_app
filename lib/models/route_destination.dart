import 'package:mapbox_gl/mapbox_gl.dart';

class RouteDestination {
  final List<LatLng> points;
  final double duration;
  final double distance;

  RouteDestination({required this.points, required this.duration, required this.distance});
}
