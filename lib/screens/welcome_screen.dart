import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/blocs/blocs.dart';
import 'package:flutter_maps_app/constants/color_scheme.dart';
import 'package:flutter_maps_app/screens/map_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static final TextEditingController _vehiclesAmountController = TextEditingController();
  static final TextEditingController _destinationsAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: secondaryColor);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vehicle Routing Problem",
          style: TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: fourthColor,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 30, right: 30),
        color: const Color(0xfffbfdfc),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(20),
                  child: Image.asset("assets/banner.jpeg")),
              const SizedBox(height: 20),
              const Text("Cantidad de vehiculos", style: textStyle),
              const SizedBox(height: 5),
              _TextField(controller: _vehiclesAmountController),
              const SizedBox(height: 10),
              const Text("Cantidad de destinos", style: textStyle),
              const SizedBox(height: 5),
              _TextField(controller: _destinationsAmountController),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () async {
                      if (_vehiclesAmountController.text.isEmpty) return;
                      if (_destinationsAmountController.text.isEmpty) return;

                      final int amountOfVehicles = int.tryParse(_vehiclesAmountController.text)!;
                      final int amountOfDestinations = int.tryParse(_destinationsAmountController.text)!;
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MapScreen(amountOfDestinations: amountOfDestinations, amountOfVehicles: amountOfVehicles)));

                      _destinationsAmountController.clear();
                      _vehiclesAmountController.clear();
                    },
                    child: const Text("Confirmar")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final TextEditingController controller;
  const _TextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: TextField(
          controller: controller,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
