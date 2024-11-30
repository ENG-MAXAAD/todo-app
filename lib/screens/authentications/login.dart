import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo_app/screens/task_screen.dart'; // Screen to navigate on successful login

import '../../components/header/app_bar.dart';
import '../../components/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers to manage the text field inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false; // Loading state for UI feedback

  // Function to handle user login
  Future<void> _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Validate input fields
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Please enter both email and password.");
      return;
    }

    // Set loading state to show progress indicator
    setState(() {
      _isLoading = true;
    });

    try {
      // Send POST request to the backend server for login
      final response = await http.post(
        Uri.parse(
            'http://192.168.7.117:9000/user/login'), // Replace with your server's login endpoint
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      // Check server response
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Check if login was successful
        if (responseData['status'] == 'Success') {
          // Navigate to the task screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TasksScreen()),
          );
        } else {
          _showErrorDialog(responseData['message'] ?? 'Login failed.');
        }
      } else {
        _showErrorDialog('Server error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      _showErrorDialog('An error occurred. Please try again.');
    } finally {
      // Hide loading state after request completes
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppHeader().buildPreferredSize(context, "Log in", Icons.arrow_back),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email text field
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your email',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),

            // Password text field
            CustomTextField(
              controller: _passwordController,
              hintText: 'Enter your password',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 16),

            // Forgot password link (optional)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to Reset Password screen if implemented
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  'Forgot Password?',
                  style:
                      GoogleFonts.inter(fontSize: 14, color: Color(0xff2563EB)),
                ),
              ),
            ),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('Log In', style: GoogleFonts.inter(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xff2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            // Sign up link
            const SizedBox(height: 16),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xff2563EB)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to the Sign Up screen
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SignUpScreen()),
                          // );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
