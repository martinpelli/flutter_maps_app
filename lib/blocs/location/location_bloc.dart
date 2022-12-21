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
    on<OnStartFollowingUser>((event, emit) => emit(state.copyWith(followingUser: true)));

    on<OnStopFollowingUser>((event, emit) => emit(state.copyWith(followingUser: false)));

    on<OnNewUserLocationEvent>((event, emit) =>
        emit(state.copyWith(lastKnownLocation: event.newLocation, myLocationHistory: [...state.myLocationHistory, event.newLocation])));
  }

  Future getCurrentPosition() async {
    final Position position = await Geolocator.getCurrentPosition();
    add(OnNewUserLocationEvent(LatLng(position.latitude, position.longitude)));
  }

  void startFollowingUser() {
    add(OnStartFollowingUser());
    positionStream = Geolocator.getPositionStream().listen((event) {
      final LatLng position = LatLng(event.latitude, event.longitude);
      add(OnNewUserLocationEvent(position));
    });
  }

  void stopFollowingUser() {
    add(OnStopFollowingUser());
    positionStream?.cancel();
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
