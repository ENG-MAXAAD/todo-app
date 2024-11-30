import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/header/app_bar.dart';
import '../../components/widgets/custom_textfield.dart';
import 'login.dart'; // Import LoginScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for managing input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _termsAccepted = false; // Track if the user accepted terms
  bool _isLoading = false; // Track loading state for button

  // Method to handle the sign-up process
  Future<void> _handleSignUp() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Basic validation for empty fields
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorDialog("Please fill all fields");
      return;
    }

    // Check if terms are accepted
    if (!_termsAccepted) {
      _showErrorDialog("Please accept the terms and conditions.");
      return;
    }

    setState(() {
      _isLoading = true; // Show loading state
    });

    try {
      // Add your sign-up logic here
      // Simulate a sign-up process with a delay
      await Future.delayed(Duration(seconds: 2));

      // On success, navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      _showErrorDialog("Sign up failed: ${e.toString()}");
    } finally {
      setState(() {
        _isLoading = false; // Hide loading state
      });
    }
  }

  // Show error dialog if the input is invalid
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error', style: GoogleFonts.inter()),
        content: Text(message, style: GoogleFonts.inter()),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: GoogleFonts.inter()),
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
          AppHeader().buildPreferredSize(context, "Sign Up", Icons.arrow_back),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Name TextField
            CustomTextField(
              hintText: 'Enter your name',
              icon: Icons.person_outline,
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            // Email TextField
            CustomTextField(
              hintText: 'Enter your email',
              icon: Icons.email_outlined,
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            // Password TextField
            CustomTextField(
              hintText: 'Enter your password',
              icon: Icons.lock_outline,
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            // Terms and Conditions Checkbox
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'I accept the ',
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xff2563EB),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to terms and conditions page (if any)
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2563EB),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
            // Already have an account link
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xff2563EB),
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
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
