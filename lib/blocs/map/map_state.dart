part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isPuttingCoords;
  final int amountOfVehicles;
  final int amountOfDestinations;
  final bool isDepositPlaced;
  final int currentAmountOfDestinations;
  final bool isLoading;

  const MapState(
      {this.isMapInitialized = false,
      this.isPuttingCoords = false,
      this.amountOfVehicles = 0,
      this.amountOfDestinations = 0,
      this.isDepositPlaced = false,
      this.currentAmountOfDestinations = 0,
      this.isLoading = false});

  MapState copyWith(
          {bool? isMapInitialized,
          bool? isPuttingCoords,
          bool? showMyRoute,
          int? amountOfVehicles,
          int? amountOfDestinations,
          bool? isDepositPlaced,
          int? currentAmountOfDestinations,
          bool? isLoading}) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isPuttingCoords: isPuttingCoords ?? this.isPuttingCoords,
        amountOfVehicles: amountOfVehicles ?? this.amountOfVehicles,
        amountOfDestinations: amountOfDestinations ?? this.amountOfDestinations,
        isDepositPlaced: isDepositPlaced ?? this.isDepositPlaced,
        currentAmountOfDestinations: currentAmountOfDestinations ?? this.currentAmountOfDestinations,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props =>
      [isMapInitialized, isPuttingCoords, amountOfVehicles, amountOfDestinations, isDepositPlaced, currentAmountOfDestinations, isLoading];
}
