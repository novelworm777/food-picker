import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
  });

  final String labelText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 13.0),
      child: TextField(
        cursorColor: const Color(0xFFFFFFFF),
        decoration: _getFormDecoration(labelText),
        onChanged: onChanged,
        style: GoogleFonts.jetBrainsMono(
          color: const Color(0xFFFFFFFF),
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  /// Get default decoration for forms.
  InputDecoration _getFormDecoration(String labelText) {
    return InputDecoration(
      isDense: true,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFFFFFFF),
          strokeAlign: StrokeAlign.center,
        ),
      ),
      filled: true,
      fillColor: const Color(0xFF0097A7),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFFFFF)),
      ),
      labelStyle: GoogleFonts.jetBrainsMono(
        color: const Color(0xFFFFFFFF),
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      labelText: labelText,
    );
  }
}
