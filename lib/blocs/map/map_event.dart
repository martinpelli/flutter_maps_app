part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnStartToPutCoords extends MapEvent {
  final int amountOfVehicles;
  final int amountOfDestinations;

  const OnStartToPutCoords({required this.amountOfVehicles, required this.amountOfDestinations});
}

class OnDepositPlaced extends MapEvent {}

class OnDestinationPlaced extends MapEvent {}
