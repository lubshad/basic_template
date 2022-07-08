import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_template/basic_template.dart';
import 'package:flutter/foundation.dart';

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
    logger.info(baseUrl + path);
    for (var element in files) {
      logger.info("${element.field}  :  ${element.filename}");
    }

    var request = MultipartRequest("POST", Uri.parse(baseUrl + path));

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = key + "[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    logger.info(request.fields);

    for (var element in files) {
      request.files.add(element);
    }

    final response = await request.send();
    var httpResponse = await Response.fromStream(response);
    final jsonresposne = jsonDecode(httpResponse.body);
    // final jsonresposne = await compute(jsonDecode, httpResponse.body);
    logger.info(jsonresposne);
    return jsonresposne;
  }

  dynamic post(String path, Map<dynamic, dynamic>? params) async {
    try {
      logger.info(getPath(path));
      var encodedParams = jsonEncode(params);
      // var encodedParams = await compute(jsonEncode, params);
      logger.info(encodedParams);
      final response = await _client.post(
        getPath(path),
        body: encodedParams,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var utfDecoded = utf8.decode(response.bodyBytes);
      // var utfDecoded = await compute(utf8.decode, response.bodyBytes);
      var decodedData =jsonDecode(utfDecoded);
      // var decodedData = await compute(jsonDecode, utfDecoded);
      logger.info(decodedData);
      return decodedData;
    } catch (e) {
      rethrow;
    }
  }

  dynamic get(String path, Map<String, dynamic>? params) async {
    try {
      logger.info(getPath(path));
      logger.info(params);
      final response = await _client.get(
        Uri.parse(baseUrl + path + jsonToQuery(params)),
        // body: jsonEncode(params),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var utfDecoded = utf8.decode(response.bodyBytes);
      // var utfDecoded = await compute(utf8.decode, response.bodyBytes);
      var decodedData = jsonDecode(utfDecoded);
      // var decodedData = await compute(jsonDecode, utfDecoded);
      logger.info(decodedData);
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
        : "?" +
            json.keys.map((key) {
              return Uri.encodeQueryComponent(key) +
                  '=' +
                  Uri.encodeQueryComponent(json[key].toString());
            }).join('&');
  }
}
