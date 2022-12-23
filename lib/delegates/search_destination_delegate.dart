import 'package:flutter/material.dart';
import 'package:flutter_maps_app/models/models.dart';

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
    return Text("asd");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            leading: const Icon(Icons.location_on_outlined, color: Colors.black),
            title: const Text('Put Location manually', style: TextStyle(color: Colors.black)),
            onTap: () => close(context, SearchResult(cancel: false, manual: true)))
      ],
    );
  }
}
