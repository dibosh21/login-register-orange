import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<HttpModel> httpCallback({
  required context,
  String baseURL = 'http://restapi.adequateshop.com',
  String? subURL,
  Map<String, Object>? body,
  Map<String, String>? headers,
  Encoding? encoding,
}) async {
  var uri = subURL == null ? Uri.parse(baseURL) : Uri.parse(baseURL + subURL);
  Map<String, String> _headers = headers ?? {'Content-type': 'Application/json'};
  Encoding _encoding = (encoding ?? Encoding.getByName('utf-8'))!;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Please Wait'),
    ),
  );

  http.Response response = await http.post(
    uri,
    headers: _headers,
    body: jsonEncode(body),
    encoding: _encoding,
  );

  Map<String, dynamic> _body = jsonDecode(response.body);

  HttpModel dataMap = HttpModel(
    body: _body,
    code: response.statusCode.toString(),
  );

  return dataMap;
}

// Model Class
class HttpModel {
  HttpModel({
    this.body = const {},
    this.code,
  });
  Map<String, dynamic> body;
  String? code;
}
