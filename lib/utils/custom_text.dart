import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextType type;

  const CustomText({
    Key? key,
    required this.text,
    this.style,
    this.type = TextType.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Predefined styles based on the type
    TextStyle textStyle = style ?? _getDefaultStyle(type);
    return Text(
      text,
      style: textStyle,
    );
  }

  TextStyle _getDefaultStyle(TextType type) {
    switch (type) {
      case TextType.header:
        return GoogleFonts.roboto(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        );
      case TextType.title:
        return GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        );
      case TextType.subtitle:
        return GoogleFonts.roboto(
          fontSize: 44,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        );
      case TextType.body:
      default:
        return GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
    }
  }
}

// Enum to define text types
enum TextType {
  header,
  title,
  subtitle,
  body,
}
