part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool showMyRoute;

  final Map<String, Polyline> polylines;

  const MapState({this.isMapInitialized = false, this.isFollowingUser = true, Map<String, Polyline>? polylines, this.showMyRoute = true})
      : polylines = polylines ?? const {};

  MapState copyWith({bool? isMapInitialized, bool? isFollowingUser, Map<String, Polyline>? polylines, bool? showMyRoute}) => MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      isFollowingUser: isFollowingUser ?? this.isFollowingUser,
      polylines: polylines ?? this.polylines,
      showMyRoute: showMyRoute ?? this.showMyRoute);

  @override
  List<Object> get props => [isMapInitialized, isFollowingUser, showMyRoute, polylines];
}
