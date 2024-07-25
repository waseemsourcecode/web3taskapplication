

import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/local_domain_repo.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/remote_domain_repo.dart';
 

class UseCaseProduct {
  final RemoteDomainRepository remoteRepository;
  final LocalDomainRepository localRepository;
  UseCaseProduct(
      {required this.localRepository, required this.remoteRepository});
 
  Future<ModelResponseBox> loadAllProducts() async{
    return  await remoteRepository.loadAllProducts();
  }
 
 void favouriteProduct(int id){
  localRepository.favouriteProduct(id);
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

  List<dynamic> getFavID() {
    return localRepository.getFavID();
  }
}
