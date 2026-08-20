import '../../../core/network/api_client.dart';
import '../../../core/constants/api_constants.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    return _apiClient.post(ApiConstants.registerEndpoint, {
      'fullname': fullname,
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) {
    return _apiClient.post(ApiConstants.loginEndpoint, {
      'email': email,
      'password': password,
    });
  }
}
