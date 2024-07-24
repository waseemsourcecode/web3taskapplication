
import 'dart:ffi';

abstract class RemoteDomainRepository {
  Future<Bool> login(Map<String, String> body);
  // Future<void> signOut();

  // Future<ModelResponseBox> login(Map<String, String> body);

  // Future<ModelResponseBox> register(Map<String, String> body);

  // Future<ModelResponseBox> getCountryDataFromRemote();
  // Future<ModelResponseBox> requestToForgotPassword(String email);
  // //::::::::::::::::::DASHBOARD:::::::::::::
  // Future<ModelResponseBox> requestNews(
  //     int pageNo, EnumNewsData newsType, Map<String, String>? anyGetBody);

  // Future<ModelResponseBox> getLeakageData(String locationId, String pgNo);

  // Future<ModelResponseBox> getFaqData();

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
