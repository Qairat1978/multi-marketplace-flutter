import '../services/auth_service.dart';

class AuthController {
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final result = await AuthService.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );

      return result;
    } catch (e) {
      throw Exception("Signup failed: $e");
    }
  }

  Future<Map<String, dynamic>> confirmSignUp({
    required String email,
    required String code,
  }) async {
    return await AuthService.confirmSignUp(email: email, code: code);
  }

  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    return await AuthService.signIn(email: email, password: password);
  }
}
