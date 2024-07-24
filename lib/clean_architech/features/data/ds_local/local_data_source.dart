

abstract class LocalDataSource {
  void saveUserEmail(String email);

  bool authorizedUser(Map userCredentials);

  void logoutFromTheApp();

  bool checkAuthentication();

  void saveData(
      {bool encoding = false, required cData, required String forKey});

  getUserSavedData(String key);

  //ModelResponseBox getCountryData();

  void removeData(String key);
}