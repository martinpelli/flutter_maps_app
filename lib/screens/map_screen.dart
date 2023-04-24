import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/views/views.dart';
import 'package:flutter_maps_app/widgets/widgets.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatefulWidget {
  final int amountOfVehicles;
  final int amountOfDestinations;
  const MapScreen({super.key, required this.amountOfVehicles, required this.amountOfDestinations});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.add(const OnNewLocationEvent(LatLng(-31.5373428, -68.5248677)));

    final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
    mapBloc.add(OnStartToPutCoords(amountOfVehicles: widget.amountOfVehicles, amountOfDestinations: widget.amountOfDestinations));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null) return const Center(child: CircularProgressIndicator());

          return BlocBuilder<MapBloc, MapState>(
            buildWhen: (previous, current) =>
                previous.amountOfDestinations != current.amountOfDestinations ||
                previous.amountOfVehicles != current.amountOfVehicles ||
                (current.currentAmountOfDestinations == current.amountOfDestinations) ||
                previous.isLoading != current.isLoading,
            builder: (context, mapState) {
              return SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    MapView(initialPosition: locationState.lastKnownLocation!),
                    if (mapState.isLoading)
                      const Center(child: CircularProgressIndicator(color: Colors.white))
                    else if ((mapState.currentAmountOfDestinations == mapState.amountOfDestinations && mapState.currentAmountOfDestinations != 0))
                      const Exit()
                    else if (mapState.isPuttingCoords)
                      const ManualMarker()
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end, children: const []),
    );
  }
}
