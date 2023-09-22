import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorPickerChoice extends StatelessWidget {
  const VendorPickerChoice({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 13,
            offset: const Offset(0, 3),
          ),
        ],
        color: const Color(0xFF0097A7),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 21.0),
      padding: const EdgeInsets.symmetric(vertical: 21.0),
      child: Text(
        text,
        style: GoogleFonts.jetBrainsMono(
          color: const Color(0xFFFFFFFF),
          fontSize: 21.0,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
