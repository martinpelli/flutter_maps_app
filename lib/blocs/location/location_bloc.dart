import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<OnNewLocationEvent>((event, emit) =>
        emit(state.copyWith(lastKnownLocation: event.newLocation, myLocationHistory: [...state.myLocationHistory, event.newLocation])));
  }

  Future getStartingPosition() async {
    add(const OnNewLocationEvent(LatLng(-31.5373428, -68.5248677)));
  }
}
