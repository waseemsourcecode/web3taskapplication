 

import 'package:web3shopping_app/clean_architech/features/data/ds_local/local_data_source.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';

import '../../domain/repositories/local_domain_repo.dart';

class LocalDataRepoImpl implements LocalDomainRepository {
  final LocalDataSource localDataSource;

  LocalDataRepoImpl({required this.localDataSource});
 

  // @override
  // void updateNotificationStatus({required UserNotificationStatus forWhich, required bool status}) {
  //    localDataSource.updateNotificationStatus(forWhich,status);
  // }

  // @override
  // List<UserConfiguration> requestToKnowUserConfigurationStatus() {
  // return localDataSource.requestToKnowUserConfigurationStatus();
  // }

 
  
  @override
  bool login(Map userCredentials) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  ModelUser? checkAuthentication() {
    // TODO: implement checkAuthentication
    throw UnimplementedError();
  }
 
  
  
}
