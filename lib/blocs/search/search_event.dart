part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnActiveManualMarkerEvent extends SearchEvent {}

class OnDeactivateManualMarkerEvent extends SearchEvent {}

class OnNewPlacesFoundEvent extends SearchEvent {
  final List<Feature> places;

  const OnNewPlacesFoundEvent(this.places);
}

class OnAddToHistoryEvent extends SearchEvent {
  final Feature history;

  const OnAddToHistoryEvent(this.history);
}
