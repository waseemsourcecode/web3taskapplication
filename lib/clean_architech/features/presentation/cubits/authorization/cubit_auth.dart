import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global_functions.dart';
import '../../../domain/usecases/uc_userauth.dart';
import 'state_auth.dart';
 

class CubitAuth extends Cubit<StateAuth> {
  final UseCaseUserAuth userAuthUseCase;

  CubitAuth({required this.userAuthUseCase}) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final appState = userAuthUseCase.checkAuthentication();
     // onConsole('appState $appState');
if(appState != null){
 emit(AuthenticatedState(userData: appState));
}else{
      emit(UnAuthenticatedState());

}
     
      // if (appState is AuthenticatedState) {
      //   // final location =   isSignInData[LocalSavingKeys.baseLocationID] as String;
      //   // final userid = isSignInData[LocalSavingKeys.userID] as String;
      //   // final sTkn = isSignInData[LocalSavingKeys.sessionToken] as String;
      //   // final uEmail = isSignInData[LocalSavingKeys.email] as String;
      //   emit(appState);
      // } else {
      //   //Here we disabled this in app phase two becasuse of guest mode
      //   emit(UnAuthenticatedState());
      //   //Now
      //   // emit(const GuestMode());
      // }
    } catch (e) {
     // onConsole(e);
      emit(UnAuthenticatedState());
      //emit(const GuestMode());
    }
  }

  void logoutFromTheApp() {
    try {
      userAuthUseCase.logoutFromTheApp();
      emit(UnAuthenticatedState());
    } catch (e) {
      emit(UnAuthenticatedState());
    }
  }

  // void authenticateUser(
  //     {
  //     //required String iso,
  //     // required int locID,
  //     required String tkn,
  //     required String uID,
  //     required String email}) {
  //   // final locData =
  //   //     CountryDatum(id: locID, name: "", iso: iso, flagIconUrl: "");
  //   //userAuthUseCase.savePrimaryLocation(locData);
  //   userAuthUseCase.saveUserData(tkn, uID, email);
  //   emit(AuthenticatedState(sessionToken: tkn, userID: uID, email: email));
  // }
 
 
  bool checkIsUserLogged() {
    try {
      final isSignInData = userAuthUseCase.checkAuthentication();
     // onConsole('isSignIn $isSignInData');
      return true;
      // else{
      //   emit(AuthenticatedState(
      //       iso: iso, sessionToken: tkn, userID: uID, email: email));
      // }
    } catch (e) {
      // emit(const UnAuthenticatedState());
     // toast("oops error while checking guest mode");
      return false;
    }
  }
 
 
 
  // void login({required String email, required String pss}) {
  Future<void> login({required String email, required String pss}) async {
    try {
      emit(AuthLoading());
      final Map<String,String> map = {};
      final status =   userAuthUseCase.login(map);

      //   onConsole('isSignIn $isSignIn');
      if (status) {
        // final data = status.responseData as ModelLogin;

        // userAuthUseCase.saveUserData(
        //     data.accessToken, data.userId.toString(), email);

        // .authorizedUser({
        //   // LocalSavingKeys.baseLocationID: data.iso.toString(),
        //   LocalSavingKeys.userID: data.userId.toString(),
        //   LocalSavingKeys.sessionToken: data.accessToken,
        //   LocalSavingKeys.email: email
        // });
        //if (savingState) {
        // emit(AuthenticatedState(
        //     email: email,
        //     //  iso: data.iso,
        //     //   baseLocationID: data.locationID.toString(),
        //     userID: data.userId.toString(),
        //     sessionToken: data.accessToken));
      } else {
        // emit(AuthenticatedFailed(
        //     failedStatus: status.responseSituation,
        //     message: status.responseData));
        emit(AuthenticatedFailed(
            //failedStatus: status.responseSituation,
            errorMessage: ""));
      }
    } catch (e) {
      onConsole(e);
      final lll = e.toString();
      toast(lll);
      // emit(const CredentialFailed(
      //     failedStatus: DataResponseStatus.failed, message: "Error"));
      emit(AuthenticatedFailed(
          //failedStatus: status.responseSituation,
          errorMessage: "Erro while login"));
    }
  }

  void moveBackToLoginDecision() {
   // emit(ResetToLoginDecision());
  }
 
 
  void backToLogin() {
    emit(UnAuthenticatedState());
  }

  void initState() {
    emit(AuthInitial());
  }
}

enum RememberState { boardScreen }
