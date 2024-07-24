import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:web3shopping_app/clean_architech/core/network/server_ports.dart';
import 'package:web3shopping_app/clean_architech/features/data/ds_remote/remote_ds_impl.dart';

import '../../features/data/ds_local/local_ds_impl.dart';
import '../../features/data/models/model_responsebox.dart';
import '../global_functions.dart';
import 'data_parser.dart'; 

extension ApiRequester on RemoteDataSourceImpl {
  Future<bool> con() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      } else {
        toast('No Network available.');
        return Future.value(false);
      }
    } on SocketException catch (_) {
      toast('No Network available.');
      return Future.value(false);
    } on TimeoutException catch (_) {
      toast('Seem very slow network.');
      return Future.value(false);
    }
  }

  Future<ModelResponseBox> fromHttpRequest(
      {required RequestType reqType,
      required ServerPorts endPont,
      Map<String, String> requestBody = const {'': ''},
      String appendID = '',
      String profileImageLocalPath = ''}) async {
    try {
      final internetCheck = await con();
      if (!internetCheck) {
        return ModelResponseBox(
            responseSituation: DataResponseStatus.noNetwork,
            responseData: null);
      }

      var token = "";
      try {
        final session = box.get(LocalSavingKeys.sessionToken);
        if (session != null) {
          token = session!; //data[LocalSavingKeys.sessionToken];
        }
      } catch (e) {
        onConsole("ERROR WHILE FETCHING TOKEN $e");
        //no need to return here because some api work without token
      }
      //    onConsole("TOKEN***************");
//onConsole(token);
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token"
      };
      var updatedEndPoint = _configureEndPoint(endPont, appendID, requestBody);

      onConsole("Requested URL: $updatedEndPoint");

      final encodedParams = json.encode(requestBody);
      late Response<String> response;
      onConsole("Sending Params: $encodedParams");
      switch (reqType) {
        case RequestType.post:
          onConsole("Sending Params: $encodedParams");
          if (profileImageLocalPath.isNotEmpty) {
            onConsole("Multipart started  : $profileImageLocalPath");
            final File file = File(profileImageLocalPath);
            String fileName = file.path.split('/').last;
            FormData formData = FormData.fromMap({
              "image":
                  await MultipartFile.fromFile(file.path, filename: fileName),
            });
            response = await dio.post(updatedEndPoint,
                data: formData, options: Options(headers: requestHeaders));
          } else {
            response = await dio.post(
              updatedEndPoint,
              data: encodedParams,
              options: Options(headers: requestHeaders),
            );
          }
          break;
        case RequestType.get:
          response = await dio.get(
            updatedEndPoint,
            // data: encodedParams,
            options: Options(headers: requestHeaders),
          );
        default:
          return ModelResponseBox(
              responseSituation: DataResponseStatus.failed,
              responseData: 'Please try again.');
      }
      onConsole("Received StatusCode: ${response.statusCode}");
      onConsole(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataParsing.parseSuccessData(
            endPoints: endPont, dataObject: response.data);
      } else {
        return    ModelResponseBox(
              responseSituation: DataResponseStatus.failed,
              responseData: 'Please try again.');
      }
    } on SocketException catch (se) {
      onConsole("Socket Exception at Port: ${se.port}");
      return ModelResponseBox(
          responseSituation: DataResponseStatus.socketException,
          responseData: null);
    } on DioException catch (se) {
      onConsole('DIO EXCEPTION DETECTED111');
      if (se.type == DioExceptionType.connectionError) {
        // ||
        onConsole('CONN ERROR');
        //  se.type == DioExceptionType.badResponse
        return ModelResponseBox(
            responseSituation: DataResponseStatus.socketException,
            responseData: 'Please try again.');
      }
      return    ModelResponseBox(
              responseSituation: DataResponseStatus.failed,
              responseData: 'Please try again.');
    } on Exception catch (se) {
      onConsole("EXception oh oops");
      return ModelResponseBox(
          responseSituation: DataResponseStatus.failed,
          responseData: se.toString());
    } catch (e) {
      onConsole('EXCEPTION DETECTED okok ');
      onConsole(e);
      // toast('Connection Break');
      return ModelResponseBox(
          responseSituation: DataResponseStatus.failed, responseData: null);
    }
  }

  String _configureEndPoint(ServerPorts endPont, String appendID, [anyBody]) {
    var configuredEndPoint = endPont.name;
    
    return configuredEndPoint;
  }
}
