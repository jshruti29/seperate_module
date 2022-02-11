import 'dart:async';
import 'dart:convert';
import 'dart:io';

//import 'package:career_lift_mobile_app/common/utilities/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/common/utilities/api_constants.dart';

import 'custom_exception.dart';

class ApiProvider {
  Future<dynamic> get(String request, [String? token]) async {
    var responseJson;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + request);
      print("url-->" + request.toString());
      final response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String request, Map body, [String? token]) async {
    var responseJson;
    print("request-->" + request.toString());
    print("Body-->" + body.toString());
    var url;
    try {
      if (request.contains('http://35.244.50.14')) {
        url = Uri.parse(request);
      } else {
        url = Uri.parse(ApiConstants.baseUrl + request);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } finally {
      final response = await http.post(url, body: body);
      responseJson = _response(response);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw BadResponseException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
