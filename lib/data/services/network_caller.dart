import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      _logResponse(url, response);
      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200 ||
          decodedData['status'] == 'OK' ||
          decodedData['status'] == true) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['msg'] ?? 'API returned an error',
        );
      }
    } catch (e) {
      debugPrint('Network Caller Exception : $e');
      return NetworkResponse(isSuccess: false, responseCode: -1, errorMessage: e.toString());
    }
  }

  void _logResponse(String url, http.Response response) {
    debugPrint(
      'Url: $url\n'
      'Response: ${response.statusCode}\n'
      // 'Body: ${response.body}',
    );
  }
}

class NetworkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body,
    this.errorMessage,
  });
}
