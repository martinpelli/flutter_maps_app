import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/constants/constants.dart';
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
        child: MapboxMap(
            trackCameraPosition: true,
            onMapCreated: (controller) {
              final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
              mapBloc.mapboxMapController = controller;
            },
            styleString: "mapbox://styles/mapbox/navigation-night-v1",
            initialCameraPosition: initialCameraPosition,
            accessToken: accessToken));
  }
}
