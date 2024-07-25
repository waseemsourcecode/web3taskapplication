 
import '../../../data/models/model_product.dart';
import '../../../data/models/model_responsebox.dart';

abstract class StateProduct {
  const StateProduct();
}

class StateProductInitial extends StateProduct {}

class StateProductLoading extends StateProduct {}

class StateProductLoaded extends StateProduct {
  final List<ModelProduct> product; 
  const StateProductLoaded(
      {required this.product});
}

class StateProductFailed extends StateProduct {
  final DataResponseStatus  reason; 
  const StateProductFailed(
      {required this.reason});
}
 
 class StateProductLoadedFav extends StateProduct {
  final List<ModelProduct> product; 
  const StateProductLoadedFav(
      {required this.product});
}
 
 
 