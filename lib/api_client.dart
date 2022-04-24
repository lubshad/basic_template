import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_temblate/basic_temblate.dart';
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
    logger.info(baseUrl+ path);
    for (var element in files) {
      logger.info("${element.field}  :  ${element.filename}");
    }

    var request =
        MultipartRequest("POST", Uri.parse(baseUrl+ path));

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = key + "[$index]";
          request.fields[fieldString] = element;
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
    final jsonresposne = json.decode(httpResponse.body);
    logger.info(jsonresposne);
    return jsonresposne;
  }

  dynamic post(String path, Map<dynamic, dynamic>? params) async {
    try {
      logger.info(getPath(path));
      logger.info(jsonEncode(params));
      final response = await _client.post(
        getPath(path),
        body: jsonEncode(params),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      logger.info(json.decode(response.body));
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Uri getPath(String path) {
    final url = Uri.parse(baseUrl+ path);
    return url;
  }
}
