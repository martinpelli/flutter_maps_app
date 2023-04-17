part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnToggleUserRoute extends MapEvent {}

class OnStartToPutCoords extends MapEvent {}
