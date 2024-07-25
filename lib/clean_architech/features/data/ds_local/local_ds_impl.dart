 

import 'package:hive/hive.dart';
import 'package:web3shopping_app/clean_architech/features/data/ds_local/local_data_source.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';
 
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
  void logoutFromTheApp() {
    try {
      box.delete(LocalSavingKeys.isLogin);
       
     // onConsole("USER CREDENTIALS DELETED");
    } catch (e) {
     // onConsole(e);
      box.delete(LocalSavingKeys.isLogin);
    }
  }

  @override
  ModelUser? checkAuthentication() {
    try {
      // final email = userCredentials[localSavingKeys.email.name];
      final isUserNewToApp = box.get(LocalSavingKeys.isLogin);
      onConsole("ISLOGIN $isUserNewToApp");
      if (isUserNewToApp == null) { 
        return null;
      } else {
         // final email = userCredentials[localSavingKeys.email.name];
         // final email = userCredentials[localSavingKeys.email.name];
      final email = box.get(LocalSavingKeys.email);
       final userName = box.get(LocalSavingKeys.username);
       final obj = ModelUser(id: 1, userName: userName, password: "", email: email);
       return obj;

        
      }
    } catch (e) {
      onConsole(e);
        return null;
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
  ModelUser? login(Map userCredentials) {
    try {
      onConsole("*************************LOCAL DECODED DATA**********");
      // box.delete(key);
      // final email = userCredentials[localSavingKeys.email.name];
      final data = box.get(LocalSavingKeys.username);
         final email = box.get(LocalSavingKeys.email);
        //    final password = box.get("password"); 
      // onConsole("Showing raw data ");
      // onConsole(data);
      if (data != null) {
        if(email == userCredentials["email"]){
          return ModelUser(id: 1, userName: data, email: email,password: "");
        }else {
          return null;
        }
             
      }
      return null;
    } catch (e) {
      onConsole("'Error while loading data' $e with key ");
      toast('Error while loading data');
      return null;
    }
  }
  
  @override
  ModelResponseBox registerUser(ModelUser obj) {
    try {
      onConsole("*************************LOCAL REGISTER DECODED DATA**********");
      // box.delete(key);
      // final email = userCredentials[localSavingKeys.email.name];
      
         final email = box.get("email"); 
       onConsole("Showing raw data $email");
      // onConsole(data);
      if (email != null) {

        if(email == obj.email){
          return ModelResponseBox(responseData: "user alreadyb registered",responseSituation: DataResponseStatus.failed);
        }else {
           box.put(LocalSavingKeys.email, obj.email);
            box.put(LocalSavingKeys.username, obj.userName);
        return ModelResponseBox(responseData: "user registered",responseSituation: DataResponseStatus.success);
        }
             
      }else{
         box.put(LocalSavingKeys.email, obj.email);
            box.put(LocalSavingKeys.username, obj.userName);
          return ModelResponseBox(responseData: "user registered",responseSituation: DataResponseStatus.success);
       
      }
     
    } catch (e) {
      onConsole("'Error while loading data' $e with key ");
      toast('Error while loading data');
        return ModelResponseBox(responseData: "user failed to registered",responseSituation: DataResponseStatus.failed);
       
    }
  }
  
  @override
  void saveLogin() {
    box.put(LocalSavingKeys.isLogin, true);
  }
  
  @override
  ModelUser? loadUserProfile() {
    try {
      // final email = userCredentials[localSavingKeys.email.name];
      final isUserNewToApp = box.get(LocalSavingKeys.isLogin);
      onConsole("ISLOGIN $isUserNewToApp");
      if (isUserNewToApp == null) { 
        return null;
      } else {
         // final email = userCredentials[localSavingKeys.email.name];
         // final email = userCredentials[localSavingKeys.email.name];
      final email = box.get(LocalSavingKeys.email);
       final userName = box.get(LocalSavingKeys.username);
       final obj = ModelUser(id: 1, userName: userName, password: "", email: email);
       return obj;

        
      }
    } catch (e) {
      onConsole(e);
        return null;
    }
  }

   
}

//::::::::::::::::::::::::::::::KEYS FOR HANDLING HIVE DATA BASE::::::::::::::::;;;;

class LocalSavingKeys {  
  
  static var isLogin = "guestAgreed";
  LocalSavingKeys._(); 
  static const username = "username";
  static const userID = "userID";
  static const email = "email"; 
 

  //  , , ,
}
