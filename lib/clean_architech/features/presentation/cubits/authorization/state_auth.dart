// import 'package:equatable/equatable.dart';

// abstract class AuthState extends Equatable {
//   const AuthState();
// }

// class AuthInitial extends AuthState {
//   @override
//   List<Object> get props => [];
// }

// class AuthenticatedState extends AuthState {
//   final String sessionToken;
//   final String userID;
//   const AuthenticatedState({required this.sessionToken, required this.userID});
//   @override
//   List<Object> get props => [userID, sessionToken];
// }

// class UnAuthenticatedState extends AuthState {
//   @override
//   List<Object> get props => [];
// }

 
import 'package:web3shopping_app/clean_architech/features/data/models/model_user.dart';

abstract class StateAuth {
  const StateAuth();
}

class AuthInitial extends StateAuth {}

class AuthBackToLogin extends StateAuth {}

class AuthenticatedState extends StateAuth {
  final ModelUser userData; 
  const AuthenticatedState(
      {required this.userData});
}

// class GuestMode extends AuthState {

//   const GuestMode(
//        );
// }

class UnAuthenticatedState extends StateAuth {}

class AuthenticatedFailed extends StateAuth {
  final String errorMessage;

  AuthenticatedFailed({required this.errorMessage});
}

class AuthLoading extends StateAuth {}
  