import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialLoginButton extends StatelessWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.imageUrl,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 16.0),
          child: Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
        label: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff212121),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
            side: BorderSide(color: Color(0xffE9E9EA), width: 1),
          ),
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
