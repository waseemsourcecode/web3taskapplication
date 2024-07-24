

import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';

abstract class RemoteDataSource {
//Credntials Sections
  Future<ModelResponseBox> isSignIn();

  Future<ModelResponseBox> login(Map<String, String> body);

  Future<ModelResponseBox> register(Map<String, String> body);

  // Future<ModelResponseBox> getCountryDataFromRemote();

  // Future<ModelResponseBox> requestToForgotPassword(String email);

  // Future<ModelResponseBox> requestNews(
  //     int pageNo, EnumNewsData newsType, Map<String, String>? anyGetBody);
}