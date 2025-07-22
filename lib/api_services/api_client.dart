import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  // IMPORTANT: Replace this with your actual API base URL if using ApiClient.get for other APIs
  // For the 'getExibitors' API, we used the full URL directly in ExhibitorApiService,
  // so this _baseUrl might only be relevant for other API calls you make via ApiClient.
  static const String _baseUrl = 'https://your-api-domain.com/api/v1';

  static String? _accessToken; // Placeholder for user's access token

  static void setAccessToken(String? token) {
    _accessToken = token;
  }

  // Helper for common headers
  static Map<String, String> getHeaders({bool requireAuth = false}) { // Made static
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (requireAuth && _accessToken != null) {
      headers['Authorization'] = 'Bearer $_accessToken';
    }
    return headers;
  }

  // --- GET Request ---
  static Future<http.Response> get(String endpoint, {Map<String, String>? queryParameters, bool requireAuth = false}) async {
    Uri uri = Uri.parse('$_baseUrl$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    try {
      final response = await http.get(
        uri,
        headers: getHeaders(requireAuth: requireAuth),
      );
      handleResponseError(response);
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // ... (post, put, delete methods as previously provided) ...

  // Basic error handling for HTTP responses
  static void handleResponseError(http.Response response) { // Made static
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Please log in again.');
    } else if (response.statusCode == 404) {
      throw Exception('Not Found: The requested resource was not found.');
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      try {
        final errorBody = jsonDecode(response.body);
        throw Exception('Client error (${response.statusCode}): ${errorBody['message'] ?? response.body}');
      } catch (_) {
        throw Exception('Client error (${response.statusCode}): ${response.body}');
      }
    } else if (response.statusCode >= 500) {
      throw Exception('Server error (${response.statusCode}): Please try again later.');
    } else {
      throw Exception('Failed to load data: Status code ${response.statusCode}');
    }
  }
}