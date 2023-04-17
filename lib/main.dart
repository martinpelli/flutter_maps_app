import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/screens/screens.dart';
import 'package:flutter_maps_app/services/services.dart';
import 'package:flutter_maps_app/themes/themes.dart';

Future<void> main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => LocationBloc()),
    BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
    BlocProvider(create: (_) => SearchBloc(trafficService: TrafficService())),
  ], child: const MapsApp()));
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(navigatorKey: navKey, debugShowCheckedModeBanner: false, theme: getTheme(), title: 'Maps App', home: const MapScreen());
  }
}
