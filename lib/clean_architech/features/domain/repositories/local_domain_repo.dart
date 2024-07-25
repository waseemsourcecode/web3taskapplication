//CONTRACT CLASS
 
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';

import '../../data/models/model_user.dart';

abstract class LocalDomainRepository {
  ModelUser? checkAuthentication();

  ModelUser? login(Map userCredentials);

  ModelResponseBox registerUser(ModelUser obj);

  void saveLogin();

  ModelUser? loadUserProfile();

  void logoutFromTheApp() {}

  void favouriteProduct(int id) {}

  List<dynamic> getFavID() ;
 
}
