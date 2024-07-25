import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
import 'package:web3shopping_app/clean_architech/features/domain/usecases/uc_userauth.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/profile/state_profile.dart';
  
class CubitProfile extends Cubit<StateProfile> {
  final UseCaseUserAuth uc;

  CubitProfile({required this.uc})
      : super(StateProfileInitial());

   

   Future<void>  getProfile() async {
       try {
      
      emit(StateProfileLoading());
     await Future.delayed(const Duration(seconds: 2));
       final appState =    uc.loadprofileData();
      // // onConsole('appState $appState');
      if (appState != null) {
        emit(StateProfileLoaded(user: appState));
      } else {
        emit(StateProfileFailed(reason: DataResponseStatus.failed));
      }
    } catch (e) {
      // onConsole(e);
     // emit(StateRegisteredFailed(reason: "Failed to login"));
     emit(StateProfileFailed(reason: DataResponseStatus.failed));
    }
  }

  void logout() {
    uc.logoutFromTheApp();
  }

}

 