import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<OnNewLocationEvent>((event, emit) =>
        emit(state.copyWith(lastKnownLocation: event.newLocation, myLocationHistory: [...state.myLocationHistory, event.newLocation])));
  }
}
