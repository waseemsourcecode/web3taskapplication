import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3shopping_app/clean_architech/core/global_functions.dart';
import 'package:web3shopping_app/clean_architech/features/data/models/model_product.dart';
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
    emit(StateProductFailed(reason: DataResponseStatus.failed));
    }
  }

  

  void loadFavProduct(List<ModelProduct> product) async{
      try {
      final List<ModelProduct> dd = [];
      emit(StateProductLoading());
      // await Future.delayed(const Duration(seconds: 5));
       final favdata =    uc.getFavID();
      // // onConsole('appState $appState');
      if (favdata.isNotEmpty) {
product.forEach((element) {
   onConsole("Doing");
  if(favdata.contains(element.id)){
    onConsole("YES");
dd.add(element);
  }
});
 onConsole("Done");
if(dd.isNotEmpty){
   onConsole("No");
 emit(StateProductLoadedFav(product: dd));
}else{
   onConsole("fail");
 emit(StateProductFailed(reason: DataResponseStatus.failed));
}
       
      } else {
       emit(StateProductFailed(reason: DataResponseStatus.failed));
      }
    } catch (e) {
       onConsole(e);
    emit(StateProductFailed(reason: DataResponseStatus.failed));
    }
  }

  void addav(int id) {
    uc.favouriteProduct(id);
  }

}

 