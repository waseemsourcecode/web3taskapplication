import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/login/state_login.dart';

import '../../../domain/usecases/uc_userauth.dart';

class CubitRegister extends Cubit<StateRegister> {
  final UseCaseUserAuth userAuthUseCase;

  CubitRegister({required this.userAuthUseCase})
      : super(StateRegisterdInitial());

  Future<void> login({required String email, required String password}) async {
    try {
      final Map<String, String> mp = {"email": email, "password": password};
      emit(StateRegistering());
      await Future.delayed(const Duration(seconds: 5));
      final appState = userAuthUseCase.login(mp);
      // onConsole('appState $appState');
      if (appState != null) {
        emit(StateRegistered(userData: appState));
      } else {
        emit(StateRegisteredFailed(reason: "Failed to login"));
      }
    } catch (e) {
      // onConsole(e);
      emit(StateRegisteredFailed(reason: "Failed to login"));
      //emit(const GuestMode());
    }
  }

  void registerUser(String usrname, String email, String password) async {
    try {
      final obj =
          ModelUser(id: 1, userName: usrname, email: email, password: password);
      emit(StateRegistering());
      await Future.delayed(const Duration(seconds: 5));
      final appState = userAuthUseCase.registerUser(obj);
      // onConsole('appState $appState');
      if (appState.responseSituation == DataResponseStatus.success) {
        emit(StateRegistered(userData: obj));
      } else {
        emit(StateRegisteredFailed(reason: appState.responseData));
      }
    } catch (e) {
      // onConsole(e);
      emit(StateRegisteredFailed(reason: "Failed to register"));
      //emit(const GuestMode());
    }
  }
}

 