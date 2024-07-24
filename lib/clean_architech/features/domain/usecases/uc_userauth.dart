
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/local_domain_repo.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/remote_domain_repo.dart';
 

class UseCaseUserAuth {
  final RemoteDomainRepository remoteRepository;
  final LocalDomainRepository localRepository;
  UseCaseUserAuth(
      {required this.localRepository, required this.remoteRepository});
  //this will be called in cubit
  logoutFromTheApp() {
   // localRepository.logoutFromTheApp();
  }

  ModelUser? checkAuthentication() {
    return localRepository.checkAuthentication();
  }
  // Map? checkAuthentication() {
  //   return localRepository.checkAuthentication();
  // }

  

  // void savePrimaryLocation(CountryDatum locData) {
  //   localRepository.saveData(true, locData, LocalSavingKeys.primaryLoc);
  // }

  

  // void remember(RememberState state) {
  //   localRepository.saveData(false, true, LocalSavingKeys.checkInOnboard);
  // }

  // void saveUserData(String tkn, String uID, String email) {
  //   localRepository.saveData(false, tkn, LocalSavingKeys.sessionToken);
  //   localRepository.saveData(false, uID, LocalSavingKeys.userID);

  //   localRepository.saveData(false, email, LocalSavingKeys.email);
  // }
 
  bool login(Map userCredentials) {
    return localRepository.login(userCredentials);
  
  }
}
