import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapboxMapController? mapboxMapController;
  List<LatLng> depositAndDestinations = [];

  MapBloc() : super(const MapState()) {
    on<OnStartToPutCoords>(_onStartToPutCoords);

    on<OnDepositPlaced>(_onDepositPlaced);

    on<OnDestinationPlaced>(_onDestinationPlaced);

    on<OnClearAll>(_onClearAll);

    on<OnLoading>(_onLoading);
  }

  FutureOr<void> _onStartToPutCoords(OnStartToPutCoords event, Emitter<MapState> emit) {
    emit(state.copyWith(isPuttingCoords: true, amountOfDestinations: event.amountOfDestinations, amountOfVehicles: event.amountOfVehicles));
  }

  FutureOr<void> _onDepositPlaced(OnDepositPlaced event, Emitter<MapState> emit) {
    emit(state.copyWith(isDepositPlaced: true));
  }

  FutureOr<void> _onDestinationPlaced(OnDestinationPlaced event, Emitter<MapState> emit) {
    emit(state.copyWith(currentAmountOfDestinations: state.currentAmountOfDestinations + 1));
  }

  FutureOr<void> _onClearAll(OnClearAll event, Emitter<MapState> emit) {
    depositAndDestinations.clear();
    mapboxMapController!.clearLines();
    mapboxMapController!.clearSymbols();
    emit(const MapState());
  }

  FutureOr<void> _onLoading(OnLoading event, Emitter<MapState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
