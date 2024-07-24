import 'package:flutter/material.dart';

class AppNavigations {
  AppNavigations._();

  static navigateTo(BuildContext context, String destinationName,
      [Object? anyArguments]) {
    // onConsole('Received argument $anyArguments');
    Navigator.pushNamed(context, destinationName, arguments: anyArguments);
  }

  static void pushToInitial(BuildContext context, String destinationName,
      [dynamic anyArguments]) {
    Navigator.pushNamedAndRemoveUntil(
        context, destinationName, (Route<dynamic> route) => false);
  }

  static void navigateBack(BuildContext context, [dynamic anyReturnData]) {
    Navigator.pop(context);
  }
}
