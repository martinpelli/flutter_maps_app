import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialPosition;
  final Set<Polyline> polylines;

  const MapView({Key? key, required this.initialPosition, required this.polylines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(target: initialPosition, zoom: 20);
    final size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          onPointerMove: (event) => mapBloc.add(OnStopFollowingUserEvent()),
          child: GoogleMap(
            onMapCreated: (controller) => mapBloc.add(OnMapInitilizedEvent(controller)),
            initialCameraPosition: initialCameraPosition,
            polylines: polylines,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onCameraMove: (position) => mapBloc.mapCenter = position.target,
          ),
        ));
  }
}
