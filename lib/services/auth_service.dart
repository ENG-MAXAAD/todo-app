import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // The base URL for your Node.js API (update if different)
  final String baseUrl = 'http://localhost:3000';

  // Login function
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      // Make POST request with email and password
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        return json.decode(response.body);
      } else {
        // Invalid credentials or server error
        return {'error': 'Invalid email or password'};
      }
    } catch (e) {
      // Handle any exceptions (network issues, etc.)
      return {'error': 'Something went wrong. Please try again.'};
    }
  }
}
