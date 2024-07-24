import 'dart:convert';

import 'server_ports.dart';

class DataParsing {
  static parseSuccessData(
      {required ServerPorts endPoints,
      required dataObject,
      bool signedUpFromOTP = false}) {
    var convertDataToJson = json.decode(dataObject);

    // toast(dataObject);
    // try {
    //   switch (endPoints) {
    //      } catch (e) {
    //   onConsole(e);
    //   toast('Found error but unable to parse it.');
    //   return ModelResponseBox(
    //       responseSituation: DataResponseStatus.failed, responseData: null);
    // }
  }

  static (bool, String?) verifyData(dynamic convertDataToJson) {
    //final parsed = ModelBaseParse.fromJson(convertDataToJson);
    if (convertDataToJson["status_code"] == 0) {
      return (false, convertDataToJson["message"]);
    } else {
      return (true, null);
    }
  }
}
