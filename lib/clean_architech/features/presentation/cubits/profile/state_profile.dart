 
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';
 
import '../../../data/models/model_responsebox.dart';

abstract class StateProfile {
  const StateProfile();
}

class StateProfileInitial extends StateProfile {}

class StateProfileLoading extends StateProfile {}

class StateProfileLoaded extends StateProfile {
  final ModelUser user; 
  const StateProfileLoaded(
      {required this.user});
}

class StateProfileFailed extends StateProfile {
  final DataResponseStatus  reason; 
  const StateProfileFailed(
      {required this.reason});
}
 
 
 
 