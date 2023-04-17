import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maps_app/constants/constants.dart';

class StartForm extends StatelessWidget {
  const StartForm({super.key});

  static final TextEditingController _vehiclesAmountController = TextEditingController();
  static final TextEditingController _destinationsAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          const TextStyle textStyle = TextStyle(color: thirdColor);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: primaryColor,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              title: const Text("VRP", textAlign: TextAlign.center, style: textStyle),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text("Cantidad de vehiculos", style: textStyle),
                  const SizedBox(height: 5),
                  _TextField(controller: _vehiclesAmountController),
                  const SizedBox(height: 10),
                  const Text("Cantidad de destinos", style: textStyle),
                  const SizedBox(height: 5),
                  _TextField(controller: _destinationsAmountController)
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Confirmar"))
              ],
            ),
          );
        },
        child: const Text("Empezar"));
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
