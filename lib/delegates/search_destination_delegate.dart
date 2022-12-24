import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchDestinationdelegate extends SearchDelegate<SearchResult> {
  SearchDestinationdelegate() : super(searchFieldLabel: 'Search destinations');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (() => query = ''), icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (() => close(context, SearchResult(cancel: true))), icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final proximity = BlocProvider.of<LocationBloc>(context).state.lastKnownLocation!;
    searchBloc.getPlacesByQuery(proximity, query);

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final place = state.places[index];
              return ListTile(
                title: Text(place.text),
                subtitle: Text(place.placeName),
                leading: const Icon(Icons.place_outlined, color: Colors.black),
                onTap: () {
                  final searchResult = SearchResult(
                      cancel: false,
                      manual: true,
                      position: LatLng(place.center[1], place.center[0]),
                      name: place.text,
                      description: place.placeName);

                  searchBloc.add(OnAddToHistoryEvent(place));

                  close(context, searchResult);
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.places.length);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchHistory = BlocProvider.of<SearchBloc>(context).state.history;
    return ListView(
      children: [
        ListTile(
            leading: const Icon(Icons.location_on_outlined, color: Colors.black),
            title: const Text('Put Location manually', style: TextStyle(color: Colors.black)),
            onTap: () => close(context, SearchResult(cancel: false, manual: true))),
        for (Feature history in searchHistory) ...[
          ListTile(
              leading: const Icon(Icons.history, color: Colors.black),
              title: Text(history.text),
              subtitle: Text(history.placeName),
              onTap: () => close(
                  context,
                  SearchResult(
                      cancel: false, position: LatLng(history.center[1], history.center[0]), name: history.text, description: history.placeName)))
        ]
      ],
    );
  }
}
