import 'package:http/http.dart' as http;

class ApiConstants {
  static const String baseUrl =
      "https://homeaibackend-production.up.railway.app";

  static const String register = "$baseUrl/api/users/register";
  static const String verifyOTP = "$baseUrl/api/users/verify-otp";
  static const String login = "$baseUrl/api/users/login";
  static const String editProfile = "$baseUrl/api/users/profile";
  static const String sendOTP = "$baseUrl/api/users/send-otp";
  static const String resetPassword = "$baseUrl/api/users/reset-password";

  static Future<bool> isServerReachable() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false; 
    }
  }
}
