part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isPuttingCoords;
  final bool showMyRoute;

  const MapState({this.isMapInitialized = false, this.isPuttingCoords = false, this.showMyRoute = true});

  MapState copyWith({bool? isMapInitialized, bool? isPuttingCoords, bool? showMyRoute}) => MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      isPuttingCoords: isPuttingCoords ?? this.isPuttingCoords,
      showMyRoute: showMyRoute ?? this.showMyRoute);

  @override
  List<Object> get props => [isMapInitialized, isPuttingCoords, showMyRoute];
}
