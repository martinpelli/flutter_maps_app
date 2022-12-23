import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/delegates/delegates.dart';
import 'package:flutter_maps_app/models/models.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker ? const SizedBox() : FadeInDown(duration: const Duration(milliseconds: 300), child: const _SearchBarBody());
      },
    );
  }
}

class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({Key? key}) : super(key: key);

  void onSearchresults(BuildContext context, SearchResult searchResult) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if (searchResult.manual) {
      searchBloc.add(OnActiveManualMarkerEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: GestureDetector(
          onTap: () async {
            final searchResult = await showSearch(context: context, delegate: SearchDestinationdelegate());

            if (searchResult == null) return;

            onSearchresults(context, searchResult);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))]),
            child: const Text(
              "Where do you want to go?",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
