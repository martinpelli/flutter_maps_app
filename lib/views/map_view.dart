import 'package:flutter/material.dart';
import 'package:flutter_maps_app/themes/themes.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapView extends StatelessWidget {
  final LatLng initialPosition;

  const MapView({Key? key, required this.initialPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition = CameraPosition(target: initialPosition, zoom: 17);
    final size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: size.height,
        child: MapboxMap(styleString: "mapbox://styles/mapbox/navigation-night-v1", initialCameraPosition: initialCameraPosition, accessToken: ""));
  }
}
