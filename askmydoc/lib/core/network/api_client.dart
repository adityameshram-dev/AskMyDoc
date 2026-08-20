import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const ApiException(this.message, {this.statusCode, this.data});

  @override
  String toString() => message;
}

class ApiClient {
  static const Duration _requestTimeout = Duration(seconds: 20);

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse('${ApiConstants.baseUrl}$endpoint'),
            headers: const {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(_requestTimeout);

      final responseData = _decodeResponse(response.body);

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ApiException(
          _messageFromData(responseData) ??
              'Request failed with status ${response.statusCode}.',
          statusCode: response.statusCode,
          data: responseData,
        );
      }

      return responseData;
    } on ApiException {
      rethrow;
    } on http.ClientException {
      throw const ApiException(
        'Could not connect to the server. Check that Django is running and the API URL is correct.',
      );
    } on TimeoutException {
      throw const ApiException(
        'The server took too long to respond. Check that Django is running.',
      );
    } on FormatException {
      throw const ApiException('The server returned an invalid response.');
    } on Exception catch (error) {
      throw ApiException('Network request failed: $error');
    }
  }

  Map<String, dynamic> _decodeResponse(String body) {
    if (body.trim().isEmpty) {
      return <String, dynamic>{};
    }

    final decoded = jsonDecode(body);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }

    throw const FormatException('Response is not a JSON object.');
  }

  String? _messageFromData(Map<String, dynamic> data) {
    final message = data['message'];
    if (message is String && message.isNotEmpty) {
      return message;
    }

    final detail = data['detail'];
    if (detail is String && detail.isNotEmpty) {
      return detail;
    }

    return null;
  }
}
