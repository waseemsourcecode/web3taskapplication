import 'dart:async';
import 'dart:ffi';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/remote_domain_repo.dart';
 

class RemoteRepoImpl implements RemoteDomainRepository {
  final RemoteDomainRepository remoteDataSource;

  RemoteRepoImpl({required this.remoteDataSource});

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Bool> login(Map<String, String> body) async {
    return remoteDataSource.login(body);
  }

  // @override
  // Future<Bool> register(Map<String, String> body) async {
  //   return remoteDataSource.register(body);
  // }

  
}