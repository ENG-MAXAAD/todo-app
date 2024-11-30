import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String checkmarkImagePath;

  const SuccessBottomSheet({
    Key? key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
    this.checkmarkImagePath = 'assets/badge-check.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Space for the icon
              // Dynamic Title
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1A1C1E),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              // Dynamic Message
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7B7D82),
                ),
              ),
              const SizedBox(height: 40),
              // Dynamic Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Dynamic Checkmark Icon with shadow
        Positioned(
          top: 1,
          child: Container(
            width: 91,
            height: 91,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff2563EB),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2563EB)
                      .withOpacity(0.5), // Shadow color with opacity
                  offset: const Offset(0, 24), // Shadow offset
                  blurRadius: 34, // Shadow blur
                  spreadRadius: -10, // Shadow spread
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor:
                  Colors.transparent, // Background color of the circle
              child: Image.asset(
                checkmarkImagePath,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
