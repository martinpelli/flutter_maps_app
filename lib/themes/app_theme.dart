import 'package:flutter/material.dart';
import 'package:flutter_maps_app/constants/constants.dart';

ThemeData getTheme() {
  return ThemeData().copyWith(
      inputDecorationTheme: InputDecorationTheme(
          constraints: const BoxConstraints(),
          contentPadding: const EdgeInsets.only(left: 10),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: secondaryColor, width: 2)),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: secondaryColor, width: 2)),
          fillColor: fourthColor,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(fourthColor), overlayColor: MaterialStatePropertyAll(secondaryColor))),
      outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor),
              foregroundColor: MaterialStatePropertyAll(thirdColor),
              overlayColor: MaterialStatePropertyAll(secondaryColor))));
}
