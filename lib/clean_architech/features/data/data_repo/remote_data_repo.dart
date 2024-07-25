import 'dart:async'; 
import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/remote_domain_repo.dart';

import '../ds_remote/remote_data_source.dart';
import '../models/model_responsebox.dart';
 

class RemoteRepoImpl implements RemoteDomainRepository {
  final RemoteDataSource remoteDataSource;

  RemoteRepoImpl({required this.remoteDataSource});

  @override
  Future<ModelResponseBox> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<ModelResponseBox> login(Map<String, String> body) async {
    return remoteDataSource.login(body);
  }

  @override
  Future<ModelResponseBox> loadAllProducts()async {
    return remoteDataSource.loadAllProducts();
  }

  // @override
  // Future<Bool> register(Map<String, String> body) async {
  //   return remoteDataSource.register(body);
  // }

  
}