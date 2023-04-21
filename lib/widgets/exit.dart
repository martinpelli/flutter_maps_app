import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/constants/constants.dart';

class Exit extends StatelessWidget {
  const Exit({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 30,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
        child: IconButton(
            constraints: const BoxConstraints(),
            onPressed: () {
              final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
              mapBloc.add(OnClearAll());
            },
            padding: const EdgeInsets.only(left: 6.5),
            icon: const Icon(Icons.arrow_back_ios, color: fourthColor, size: 18)),
      ),
    );
  }
}
