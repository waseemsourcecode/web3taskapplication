import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:web3shopping_app/clean_architech/features/data/ds_local/local_data_source.dart';
 
import '../../../core/global_functions.dart';

 
class LocalDataSourceImpl implements LocalDataSource {
  late final Box box;
  LocalDataSourceImpl({required this.box});

  @override
  void saveUserEmail(String email) {
    box.put(LocalSavingKeys.email, email);
    // localDataBase.setString('email', email);
  }

  @override
  bool authorizedUser(Map userCredentials) {
    try {
      final email = userCredentials[LocalSavingKeys.email];
      box.put(LocalSavingKeys.email, email);
      // userCredentials.remove(LocalSavingKeys.email);
      box.put(LocalSavingKeys.userCredentials, userCredentials);
      return true;
    } catch (e) {
      // onConsole(e);
      // toast('Error while saving');
      return false;
    }
  }

  @override
  void logoutFromTheApp() {
    try {
      box.delete(LocalSavingKeys.profile);
      box.delete(LocalSavingKeys.guestAgreed);
      // box.delete(LocalSavingKeys.userCredentials);
      // box.delete(LocalSavingKeys.iso);
      // box.delete(LocalSavingKeys.primaryLoc);
      // box.delete(LocalSavingKeys.badge);
      // box.deleteFromDisk();
      box.delete(LocalSavingKeys.sessionToken);
     // onConsole("USER CREDENTIALS DELETED");
    } catch (e) {
     // onConsole(e);
    }
  }

  @override
  bool checkAuthentication() {
    try {
      // final email = userCredentials[localSavingKeys.email.name];
      final isUserNewToApp = box.get(LocalSavingKeys.checkInOnboard);
      if (isUserNewToApp == null) {
        return false;
      } else {
       return true;

        
      }
    } catch (e) {
      onConsole(e);
        return false;
    }
  }

  @override
  dynamic getUserSavedData(String key) {
    try {
      onConsole("*************************LOCAL DECODED DATA**********");
      // box.delete(key);
      // final email = userCredentials[localSavingKeys.email.name];
      final data = box.get(key);
      // onConsole("Showing raw data ");
      // onConsole(data);
      if (data != null) {
        // if(key == LocalSavingKeys.badge){
        //   ret
        // }
        // if (key == LocalSavingKeys.country) {
        //   var convertDataToJson = json.decode(data);
        //   // onConsole(convertDataToJson);
        //   final inModelForm = ModelCountry.fromJson(convertDataToJson);
        //   return inModelForm;
        // } else if (key == LocalSavingKeys.primaryLoc) {
        //   var convertDataToJson = json.decode(data);
        //   onConsole(convertDataToJson);
        //   final inModelForm = CountryDatum.fromJson(convertDataToJson);
        //   return inModelForm;
        // } else if (key == LocalSavingKeys.secondaryLoc) {
        //   var convertDataToJson = json.decode(data);
        //   onConsole(convertDataToJson);
        //   final inModelForm = CountryDatum.fromJson(convertDataToJson);
        //   return inModelForm;
        // } else if (key == LocalSavingKeys.profile) {
        //   var convertDataToJson = json.decode(data);
        //   onConsole(convertDataToJson);
        //   final inModelForm = DataProfile.fromJson(convertDataToJson);
        //   return inModelForm;
        // }
        return data;
      }
      return null;
    } catch (e) {
      onConsole("'Error while loading data' $e with key $key");
      toast('Error while loading data');
      return null;
    }
  }

  @override
  void saveData(
      {bool encoding = false, required cData, required String forKey}) {
    try {
      if (encoding) {
        onConsole("*************************Saving Encoding**********");
        final encodedData = json.encode(cData);
        onConsole(encodedData);

        if (forKey == LocalSavingKeys.primaryLoc) {
          // box.put(forKey, encodedData);
          // final dType = cData as CountryDatum;
          // final iso = dType.iso;
          // //  onConsole("BARIER::::::::::::::::::*************%%%%%%");
          // onConsole(iso);
          // box.put(LocalSavingKeys.iso, iso);
        } else if (forKey == LocalSavingKeys.secondaryLoc) {
          // box.put(forKey, encodedData);
          // final dType = cData as CountryDatum;
          // final iso = dType.iso;
          // //  onConsole("BARIER::::::::::::::::::*************%%%%%%");
          // onConsole(iso);
          // box.put(LocalSavingKeys.secondaryLoc, iso);
        } else {
          box.put(forKey, encodedData);
        }
      } else {
        box.put(forKey, cData);
      }
      onConsole("*************************SAVED SUCCESS**********");
    } catch (e) {
      // onConsole("*************************LOCAL ERROR**********");
      onConsole('Exception at Local Storage$e with key:$forKey');
      // onConsole('Exception data was $cData');
    }
  }

  @override
  void removeData(String key) {
    try {
      box.delete(key);
    } catch (e) {
      onConsole("Error while removing data $e");
    }
  }

  @override
  List<dynamic> findHomeBoardWidgetStatus() {
    try {
      final widgets = box.get(LocalSavingKeys.homeWidgets);
      onConsole(widgets);
      if (widgets != null) {
        return widgets;
      }
      return [];
    } catch (e) {
      onConsole("EXCEPTION: $e");
      return [];
    }
  }

   
}

//::::::::::::::::::::::::::::::KEYS FOR HANDLING HIVE DATA BASE::::::::::::::::;;;;

class LocalSavingKeys {
  static const checkInOnboard = "cfffheckInOnboard";

  static const homeWidgets = "homeWidgets";

  static const guestAgreed = "guestAgreed";
  LocalSavingKeys._();
  static const userCredentials = "userCredentials";
  static const sessionToken = "sessionToken";
  static const badge = "badge";
  static const userID = "userID";
  static const email = "email";
  static const country = "country";
  static const profile = "profile";

  static const baseLocationID = "baseLocationID";

  static const primaryLoc = "primaryLoc";
  static const secondaryLoc =
      "secondaryLoc"; //when user choose location at home
  static const iso = "iso";

  //  , , ,
}
