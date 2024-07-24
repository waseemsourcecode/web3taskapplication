class ModelCheckCredReq {
  ModelCheckCredReq(
      {required this.statusCode,
      required this.message,
      this.leakagePageInfo,
      required this.leakageStatus});

  final int statusCode; //mandateory if not error will be parsing error
  final String? message;
  //mandateory if not error will be parsing error
  final String? leakagePageInfo;
  final String leakageStatus;

  factory ModelCheckCredReq.fromJson(Map<String, dynamic> json) {
    return ModelCheckCredReq(
        statusCode: json["status_code"],
        message: json["message"],
        leakagePageInfo: json["leakages_page"],
        leakageStatus: json["leakages_status"]);
  }
}