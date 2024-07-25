
 

import 'dart:async';

import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';

import '../../data/models/model_responsebox.dart';

abstract class RemoteDomainRepository {
  Future<ModelResponseBox> login(Map<String, String> body);
  Future<ModelResponseBox> signOut();

 Future< ModelResponseBox> loadAllProducts() ;
 

  // Future<ModelResponseBox> getProfileData();
  // Future<ModelResponseBox> fetchDataFromServer(
  //     {required EndPoints endPoint, String anyReqID = ""});

  // Future<ModelResponseBox> sendPostRequest(
  //     {required EndPoints endPoint,
  //     required Map<String, dynamic> map,
  //     String imageLocalPath = ""});

  // Future<StateLL> getLeakageCredentials();

  // Future<StateCvEngine> getCvEngineData();

  // Future<StateVulnerability> findVulnerAbility();

  // Future<StateVulBreachStatus> findVulnerabilityBreachStatus();

  // Future<StateCvEngine> searchCVEngine({required String searchQuery});

  // Future<StateLeakageStatus> getLeakageStatus();

  // Future<StateGenNews> fetchGenNews(int pageNo);

  // Future<StateDarkNews> fetchDarkNews(int pageNo);

  // Future<(bool, int?)> bookMarkNews(
  //     {required String id, required bool removeMark, required NewsType type});
  // Future<StateNotification> getNotifications();
  // Future<StateMyLibrary> fetchAllSavedNews();

  // Future<StateHomeStat> fetchHomeStat(String guestCountry);

  // Future<StateAffectedCountries> fetchAffectedCountries();

  // Future<StateAffectedCountries> sortDataAffectedCountry(String key);

  // Future<StateDarkNews> filterDarkNews(
  //     {required Map<String, String> filterBody, required int filterNewsPgNo});

  // Future<StateActorName> getActorNames();

  // Future<StateAffectedIndus> getAffectedIndus();

  // void removeFromLibrary(String markID, String typeID);

  // Future<StateComment> loadNewsComments(String newsID, String newsType);

  // Future<StateComment> setComment(TransferCommentData tranferData);

  // Future<StateLike> likeNews(bool isLiked, Map<String, String> map);

  // Future<StateLike> checkIsNewsLiked(Map<String, String> map);

  // Future<bool> markAsFix(String id);

  // Future<AuthState> loginWithBiometric(String bioID);

  // Future<String?> addFingerPrint();

  // Future<StateCVEngineProduct> fetchCVEngineProducts();

  // Future<StateProfile> updateUserProfile(
  //     {required Map<String, String> information});

  // Future<StateBreachAccess> checkBreachCredentialAccess();

  // Future<StateBreachAccess> requestToAccessCredentials();

  // void toggleNotificationAlert(Map<String, String> body);
}
