import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:web3shopping_app/clean_architech/core/network/api_requester.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';
 
import '../../../core/network/server_ports.dart';
import '../models/model_responsebox.dart';
import 'remote_data_source.dart';

enum RequestType { post, get }

class RemoteDataSourceImpl implements RemoteDataSource {
//  final http.Client httpClient;
  late final Box box;
  final Dio dio;
  //:::::::::::::::HTTP REQUEST:::::::::;;

  RemoteDataSourceImpl({required this.box, required this.dio});

  @override
  Future<ModelResponseBox> isSignIn() {
    throw UnimplementedError();
  }
 

  
  @override
  Future<ModelResponseBox> loadAllProducts() async{
    return fromHttpRequest(
        reqType: RequestType.get,
        endPont: ServerPorts.products,
    );
  }
  
  @override
  Future<ModelResponseBox> login(Map<String, String> body) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<ModelResponseBox> register(Map<String, String> body) {
    // TODO: implement register
    throw UnimplementedError();
  }

  // @override
  // Future<ModelResponseBox> getCountryDataFromRemote() async {
  //   return await fromHttpRequest(
  //       reqType: RequestType.get, endPont: EndPoints.countries);
  // }
}