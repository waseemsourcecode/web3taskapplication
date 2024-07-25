
 
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';

abstract class StateRegister {
  const StateRegister();
}

class StateRegisterdInitial extends StateRegister {}

class StateRegistering extends StateRegister {}

class StateRegistered extends StateRegister {
  final ModelUser userData; 
  const StateRegistered(
      {required this.userData});
}

class StateLogged extends StateRegister {
  final ModelUser userData; 
  const StateLogged(
      {required this.userData});
}
 
class StateRegisteredFailed extends StateRegister {
  final String reason;
  const StateRegisteredFailed({required this.reason});
}

 
 