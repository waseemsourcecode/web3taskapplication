   import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

ThemeData darkTheme(BuildContext context) {
    return ThemeData(
//brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondary, brightness: Brightness.dark),
      // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.secondary,
      primarySwatch: buildMaterialColor(AppColors.black),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: "Duplet",
            bodyColor: Colors.white,
          ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 40),
        hintStyle: const TextStyle(
          color: Colors.black54,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        errorStyle: const TextStyle(fontSize: 14),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 45),
          ),
          maximumSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 50),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
