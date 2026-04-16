import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  /// 🔥 API BASE URL (өз endpoint)
  static const String baseUrl =
      "https://oc9bpfq2x2.execute-api.eu-central-1.amazonaws.com/prod/";

  /// =========================
  /// 🟢 SIGN UP
  /// =========================
  static Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final url = Uri.parse("$baseUrl/signup");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "fullName": fullName,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        throw Exception(data['message'] ?? "Signup failed");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  /// =========================
  /// 🔐 SIGN IN
  /// =========================
  static Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl/signin");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data['message'] ?? "Login failed");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  /// =========================
  /// 🔄 REFRESH TOKEN
  /// =========================
  static Future<Map<String, dynamic>> refreshToken({
    required String refreshToken,
  }) async {
    final url = Uri.parse("$baseUrl/refresh-token");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"refreshToken": refreshToken}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data['message'] ?? "Refresh failed");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  /// =========================
  /// 👤 GET USER (Protected)
  /// =========================
  static Future<Map<String, dynamic>> getMe({
    required String accessToken,
  }) async {
    final url = Uri.parse("$baseUrl/me");

    try {
      final response = await http.get(
        url,
        headers: {"Authorization": accessToken},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data['message'] ?? "Fetch user failed");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  /// =========================
  /// 🚪 LOGOUT
  /// =========================
  static Future<void> logout({required String accessToken}) async {
    final url = Uri.parse("$baseUrl/logout");

    try {
      await http.post(url, headers: {"Authorization": accessToken});
    } catch (e) {
      throw Exception("Logout error: $e");
    }
  }

  /// =========================
  /// 🔢 CONFIRM SIGN UP
  /// =========================
  static Future<Map<String, dynamic>> confirmSignUp({
    required String email,
    required String code,
  }) async {
    final url = Uri.parse("$baseUrl/confirm-signup");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "code": code}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? "Confirm failed");
    }
  }

  static Future<Map<String, dynamic>> forgotPassword(String email) async {
    final res = await http.post(
      Uri.parse("$baseUrl/forgot-password"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    return jsonDecode(res.body);
  }

  /// 🔥 CONFIRM RESET
  static Future<Map<String, dynamic>> confirmForgotPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    final res = await http.post(
      Uri.parse("$baseUrl/confirm-forgot-password"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "code": code,
        "newPassword": newPassword,
      }),
    );

    return jsonDecode(res.body);
  }
}
