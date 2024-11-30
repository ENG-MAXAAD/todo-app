import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/header/app_bar.dart';
// import 'HelpSupportScreen.dart';
import '../../components/widgets/custom_textfield.dart';
import 'login.dart'; // Import LoginScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppHeader().buildPreferredSize(context, "Sign Up", Icons.arrow_back),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Name TextField
                const CustomTextField(
                  hintText: 'Enter your name',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                // Email TextField
                const CustomTextField(
                  hintText: 'Enter your email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 16),
                // Password TextField
                const CustomTextField(
                  hintText: 'Enter your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  hasSuffixIcon: true,
                ),
                const SizedBox(height: 16),
                // Terms and Conditions with Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      activeColor:
                          Color(0xFF2563EB), // Set active color to #2563EB
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: RichText(
                          text: TextSpan(
                            text: "I agree to the medidoc ",
                            style: GoogleFonts.inter(
                              color: const Color(0xFF4F5159),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Terms of Service",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             TermsOfServiceScreen()));
                                  },
                              ),
                              TextSpan(
                                text: " and ",
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF4F5159),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle Privacy Policy tap
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _termsAccepted
                        ? () {
                            // Handle Sign Up action
                          }
                        : null, // Disable button if terms not accepted
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff23262F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Gap(24),
                // Login prompt with navigation
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF4F5159),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: GoogleFonts.inter(
                            color: Color(
                                0xFF2563EB), // Color for the "Log in" text
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
