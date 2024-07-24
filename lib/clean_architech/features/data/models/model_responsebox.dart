enum DataResponseStatus { failed, success, empty, noNetwork, socketException }

class ModelResponseBox {
  late DataResponseStatus responseSituation;
  dynamic responseData;
  ModelResponseBox(
      {required this.responseSituation, required this.responseData});
}
