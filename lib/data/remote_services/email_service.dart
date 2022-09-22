import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/constants/urls.dart';
import 'app_exceptions.dart';

class EmailService {
  static const baseUrl = ApiCredential.baseUrl;

  static Future getDomains(int page) async {
    //cache file
    String fileName = "domainCache.json";
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/$fileName");
    try {
      Map<String, String> queryParams = {
        'page': page.toString(),
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = Uri.parse('$baseUrl${ApiCredential.getDomainsUrl}?$queryString');

      final response = await http.get(
        requestUrl,
      );
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
      return _renderResponse(response);
    } on SocketException {
      appPrint('No Internet');
      if(file.existsSync()){
        appPrint("from cache");
        //read from cache
        final data = file.readAsStringSync();
        var decodedJSON = json.decode(data);
        return decodedJSON;
      }else{
        throw FetchDataException('No Internet connection');
      }
    }
  }

  static Future createAccount(String email, String password) async {
    try {
      Map body = {
        'address': email,
        'password': password
      };
      final response = await http.post(
        Uri.parse(baseUrl + ApiCredential.createAccountUrl),
        body: jsonEncode(body),
        headers: {"accept": "application/json", "content-type": "application/json"}
      );
      return _renderResponse(response);
    } on SocketException {
      appPrint('No Internet');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future accountLogin(String email, String password) async {
    try {
      Map body = {
        'address': email,
        'password': password
      };
      final response = await http.post(
        Uri.parse(baseUrl + ApiCredential.tokenUrl),
        body: jsonEncode(body),
        headers: {"accept": "application/json", "content-type": "application/json"}
      );
      return _renderResponse(response);
    } on SocketException {
      appPrint('No Internet');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future fetchMessages(int page, String token) async {
    //cache file
    String fileName = "messageCache.json";
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/$fileName");
    try {
      Map<String, String> queryParams = {
        'page': page.toString(),
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = Uri.parse('$baseUrl${ApiCredential.fetchMessagesUrl}?$queryString');

      final response = await http.get(
        requestUrl,
        headers: {
          "authorization": "Bearer $token",
        }
      );
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
      return _renderResponse(response);
    } on SocketException {
      appPrint('No Internet');
      if(file.existsSync()){
        appPrint("from cache");
        //read from cache
        final data = file.readAsStringSync();
        var decodedJSON = json.decode(data);
        return decodedJSON;
      }else{
        throw FetchDataException('No Internet connection');
      }
    }
  }


  static dynamic _renderResponse(http.Response response) {
    appPrint("------------------------------");
    appPrint("Status Code ${response.statusCode}");
    appPrint("------------------------------");
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 403:
        var responseJson = json.decode(response.body);
        return responseJson;
        // throw UnauthorisedException(response.data.toString());
      case 422:
        var responseJson = json.decode(response.body);
        return responseJson;
        // throw ValidationException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  static appPrint(message) {
    if (kDebugMode) debugPrint(message);
  }

}
