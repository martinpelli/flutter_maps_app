import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/services/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import '../../models/models.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TrafficService trafficService;

  SearchBloc({required this.trafficService}) : super(const SearchState()) {
    on<OnActiveManualMarkerEvent>((event, emit) => emit(state.copyWith(displayManualMarker: true)));

    on<OnDeactivateManualMarkerEvent>((event, emit) => emit(state.copyWith(displayManualMarker: false)));

    on<OnNewPlacesFoundEvent>((event, emit) => emit(state.copyWith(places: event.places)));

    on<OnAddToHistoryEvent>((event, emit) => emit(state.copyWith(history: [event.history, ...state.history])));
  }

  Future<RouteDestination> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final TrafficResponse trafficResponse = await trafficService.getCoorsStartToEnd(start, end);

    final geometry = trafficResponse.routes[0].geometry;
    final distance = trafficResponse.routes[0].distance;
    final duration = trafficResponse.routes[0].duration;

    final points = decodePolyline(geometry, accuracyExponent: 6);

    final latLngList = points.map((coor) => LatLng(coor[0].toDouble(), coor[1].toDouble())).toList();

    return RouteDestination(points: latLngList, duration: duration, distance: distance);
  }

  Future getPlacesByQuery(LatLng proximity, String query) async {
    final response = await trafficService.getResultsByQuery(proximity, query);

    add(OnNewPlacesFoundEvent(response));
  }
}
