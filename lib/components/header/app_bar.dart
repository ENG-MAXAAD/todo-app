import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeader {
  PreferredSize buildPreferredSize(
      BuildContext context, String name, IconData icon) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0F4B5563), // Equivalent to #4B55630F
              offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
              blurRadius: 12.0, // Matches the 12px blur radius
              spreadRadius: 0, // Matches the 0px spread
            ),
          ],
        ),
        child: AppBar(
          title: Text(
            name,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0, // Remove AppBar default shadow
          foregroundColor: Colors.black, // Set color for icons and text
          leading: IconButton(
            icon: Icon(icon),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when back arrow is pressed
            },
          ),
        ),
      ),
    );
  }
}
