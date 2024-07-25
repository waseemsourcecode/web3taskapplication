 

import 'package:web3shopping_app/clean_architech/features/data/ds_local/local_data_source.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';

import '../../domain/repositories/local_domain_repo.dart';

class LocalDataRepoImpl implements LocalDomainRepository {
  final LocalDataSource localDataSource;

  LocalDataRepoImpl({required this.localDataSource});
  
 
  
  @override
  ModelUser? login(Map userCredentials) {
  return  localDataSource.login(userCredentials);
  }

  @override
  ModelUser? checkAuthentication() {
  return localDataSource.checkAuthentication();
  }
  
  @override
  ModelResponseBox registerUser(ModelUser obj) {
 return localDataSource.registerUser(obj);
  }
  
  @override
  void saveLogin() {
  localDataSource.saveLogin();
  }
  
  @override
  ModelUser? loadUserProfile() {
    return localDataSource.loadUserProfile();
  }
  
  @override
  void logoutFromTheApp() {
   localDataSource.logoutFromTheApp();
  }
 
  
  
}
