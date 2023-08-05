import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:basic_template/basic_template.dart';
import 'package:http/http.dart';

Stream<List<int>> getFileStream(Uint8List bytes) =>
    Stream.fromIterable([bytes]);

class ApiClient {
  final Client _client;
  final String baseUrl;

  ApiClient(this._client, {required this.baseUrl});

  dynamic formData(
      {required Map<String, dynamic> data,
      required List<MultipartFile> files,
      required String path}) async {
    logInfo(baseUrl + path);
    for (var element in files) {
      logInfo("${element.field}  :  ${element.filename}");
    }

    var request = MultipartRequest("POST", Uri.parse(baseUrl + path));

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = "$key[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    logInfo(request.fields);

    for (var element in files) {
      request.files.add(element);
    }

    final response = await request.send();
    var httpResponse = await Response.fromStream(response);
    final jsonresposne = jsonDecode(httpResponse.body);
    logInfo(jsonresposne);
    return jsonresposne;
  }

  dynamic post(String path, Map<dynamic, dynamic>? params) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    const maxRetries = 10;
    for (var i = 0; i < maxRetries; i++) {
      try {
        logInfo(getPath(path));
        var encodedParams = jsonEncode(params);
        logInfo(encodedParams);
        final response = await _client.post(getPath(path),
            body: encodedParams, headers: headers);
        var utfDecoded = utf8.decode(response.bodyBytes);
        var decodedData = jsonDecode(utfDecoded);
        logInfo(decodedData);
        return decodedData;
      } on SocketException catch (e) {
        // await Future.delayed(const Duration(seconds: 1));
        logInfo("Error Code ${e.osError?.errorCode} Retrying ...($i)");
        continue;
      } on ClientException catch (e) {
        // await Future.delayed(const Duration(seconds: 1));
        logInfo("${e.message} Retrying ...($i)");
        continue;
      } catch (e) {
        rethrow;
      }
    }
  }

  dynamic get(String path, Map<String, dynamic>? params) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      logInfo(getPath(path));
      logInfo(params);
      final response = await _client.get(
        Uri.parse(baseUrl + path + jsonToQuery(params)),
        headers: headers,
      );
      var utfDecoded = utf8.decode(response.bodyBytes);
      var decodedData = jsonDecode(utfDecoded);
      logInfo(decodedData);
      return decodedData;
    } catch (e) {
      rethrow;
    }
  }

  Uri getPath(String path) {
    final url = Uri.parse(baseUrl + path);
    return url;
  }

  static String jsonToQuery(Map<String, dynamic>? json) {
    return json == null
        ? ""
        : "?${json.keys.map((key) {
            return '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(json[key].toString())}';
          }).join('&')}";
  }
}
