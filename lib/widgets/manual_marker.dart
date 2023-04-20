import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/constants/constants.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
        buildWhen: (previous, current) =>
            previous.currentAmountOfDestinations != current.currentAmountOfDestinations || previous.isDepositPlaced != current.isDepositPlaced,
        builder: (context, state) {
          return _ManualMarkerBody(
              isDepositPlaced: state.isDepositPlaced, destinations: state.currentAmountOfDestinations, totalDestinations: state.amountOfDestinations);
        });
  }
}

class _ManualMarkerBody extends StatelessWidget {
  final bool isDepositPlaced;
  final int destinations;
  final int totalDestinations;

  const _ManualMarkerBody({Key? key, required this.isDepositPlaced, required this.destinations, required this.totalDestinations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 30,
            left: 20,
            child: SizedBox(
              width: size.width,
              child: Row(
                children: [
                  const _BtnBack(),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 55,
                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
                    child: Text(
                        isDepositPlaced
                            ? "Seleccione el lugar de destino ${destinations + 1}."
                            : "Seleccione el lugar donde se encuentra el depósito.",
                        style: const TextStyle(color: fourthColor, fontSize: 16)),
                  )),
                  const SizedBox(width: 40),
                ],
              ),
            )),
        Center(
            child: Transform.translate(
                offset: const Offset(0, -22),
                child: BounceInDown(from: 100, child: const Icon(Icons.location_on_rounded, size: 60, color: Colors.white)))),
        Positioned(
            bottom: 30,
            child: FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                width: 200,
                height: 35,
                child: OutlinedButton(
                  onPressed: () async {
                    final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);

                    final LatLng latLng = mapBloc.mapboxMapController!.cameraPosition!.target;
                    print(latLng);

                    if (!isDepositPlaced) {
                      mapBloc.mapboxMapController!.addSymbol(SymbolOptions(geometry: latLng, iconSize: 0.2, iconImage: "assets/deposit.png"));
                      //guardar las cordernas
                      mapBloc.add(OnDepositPlaced());
                    } else {
                      mapBloc.mapboxMapController!.addSymbol(SymbolOptions(geometry: latLng, iconSize: 0.7, iconImage: "assets/destination.png"));
                      //guardar las cordernas
                      mapBloc.add(OnDestinationPlaced());
                    }
                  },
                  child: Text(
                    destinations == totalDestinations - 1 ? 'Calcular' : 'Confirmar',
                    style: const TextStyle(color: fourthColor, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        width: 30,
        child: Container(
          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            padding: const EdgeInsets.all(5),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.arrow_back_ios_new, color: fourthColor, size: 20),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
