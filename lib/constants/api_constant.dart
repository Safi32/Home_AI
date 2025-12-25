import 'package:http/http.dart' as http;

class ApiConstants {
  // Use 10.0.2.2 for Android emulator to access localhost
  // For physical devices, use your computer's local IP address
  static const String baseUrl = "http://10.0.2.2:3000";

  // API Endpoints
  static const String register = "$baseUrl/api/users/register";
  static const String verifyOTP = "$baseUrl/api/users/verify-otp";
  static const String login = "$baseUrl/api/users/login";
  static const String editProfile = "$baseUrl/api/users/profile";

  // Helper method to check if the server is reachable
  static Future<bool> isServerReachable() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
