

import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';

import '../models/model_responsebox.dart';

abstract class LocalDataSource {
  void saveUserEmail(String email);

 
  void logoutFromTheApp();

  ModelUser? checkAuthentication();

 
  //ModelResponseBox getCountryData();

  void removeData(String key);

  ModelUser? login(Map userCredentials);

  ModelResponseBox registerUser(ModelUser obj);

  void saveLogin() ;

  ModelUser? loadUserProfile();
}