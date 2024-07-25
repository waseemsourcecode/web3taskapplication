import 'dart:convert';

import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';

import '../../features/data/models/model_responsebox.dart';
import '../global_functions.dart';
import 'server_ports.dart';

class DataParsing {
  static parseSuccessData(
      {required ServerPorts endPoints,
      required dataObject,
      bool signedUpFromOTP = false}) {
    var convertDataToJson = json.decode(dataObject);

    // toast(dataObject);
    try {
      switch (endPoints) {
        
        case ServerPorts.products:
                  final productData = List<ModelProduct>.from(convertDataToJson
              .map((x) => ModelProduct.fromJson(x)));
          return ModelResponseBox(
              responseSituation: DataResponseStatus.success,
              responseData: productData
              
             //  ModelProduct.fromJson(convertDataToJson)
               );
         }
    } 
         catch (e) {
      onConsole(e);
      toast('Found error but unable to parse it.');
      return ModelResponseBox(
          responseSituation: DataResponseStatus.failed, responseData: null);
    }
    }
  }

   
 
