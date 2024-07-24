//CONTRACT CLASS
 
import '../../data/models/model_user.dart';

abstract class LocalDomainRepository {
  ModelUser? checkAuthentication();

  bool login(Map userCredentials);
//Credentials Sections

  // void saveUserEmail(String email);

  // bool authorizedUser(Map userCredentials);

  // void logoutFromTheApp();

//   AuthState checkAuthentication();

//   dynamic getUserSavedData(String key);
//   // ModelResponseBox getCountryData();
//   void saveData(bool encoded, dynamic data, String receivedKey);

//   void removeData(String key);

//   List<dynamic> findHomeBoardWidgetStatus();

//   void saveHomeWidgets(List<Grow> filters);
//   List<OnBoardEntity> getOnBoardData();

//   void guestAgreed(String country);

//   void saveUserProfileData(DataProfile responseData);
//  PayLoadUserConfiguration getUserConfigurations() ;
//   void updateUserConfiguration({required LockKeyUserConfig forWhich , required bool status});

}
