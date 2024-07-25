import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_responsebox.dart';
 
import '../../../domain/usecases/uc_product.dart';
import 'state_product.dart';

class CubitProduct extends Cubit<StateProduct> {
  final UseCaseProduct uc;

  CubitProduct({required this.uc})
      : super(StateProductInitial());

  Future<void> loadAllProducts() async {
    try {
      
      emit(StateProductLoading());
      // await Future.delayed(const Duration(seconds: 5));
       final appState = await  uc.loadAllProducts();
      // // onConsole('appState $appState');
      if (appState.responseSituation  == DataResponseStatus.success) {
        emit(StateProductLoaded(product: appState.responseData));
      } else {
        emit(StateProductFailed(reason: appState.responseSituation));
      }
    } catch (e) {
      // onConsole(e);
     // emit(StateRegisteredFailed(reason: "Failed to login"));
      //emit(const GuestMode());
    }
  }

}

 