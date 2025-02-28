
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/local_domain_repo.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/remote_domain_repo.dart';
 

class UseCaseUserAuth {
  final RemoteDomainRepository remoteRepository;
  final LocalDomainRepository localRepository;
  UseCaseUserAuth(
      {required this.localRepository, required this.remoteRepository});
  //this will be called in cubit
  void logoutFromTheApp() {
   localRepository.logoutFromTheApp();
  }

  ModelUser? checkAuthentication() {
    return localRepository.checkAuthentication();
  }
 
 
  ModelUser? login(Map userCredentials) {
    final status = localRepository.login(userCredentials);
    if(status != null){
      localRepository.saveLogin();
    }
    return status;
  
  }

  ModelResponseBox registerUser(ModelUser obj){
  
    final status = localRepository.registerUser(obj);
    if(status.responseSituation  == DataResponseStatus.success){
      localRepository.saveLogin();
    }
    return status;
  }

 ModelUser? loadprofileData() {
  return  localRepository.loadUserProfile();
 }
}
