import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodVendorBottomModal extends StatelessWidget {
  const FoodVendorBottomModal({
    super.key,
    required this.vendorName,
  });

  final String vendorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0097A7),
      padding: const EdgeInsets.only(left: 21.0, right: 21.0, top: 37.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vendor Name:',
            style: GoogleFonts.jetBrainsMono(
              color: const Color(0xFFBDBDBD),
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 7.0),
          Text(
            vendorName.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              color: const Color(0xFFFFFFFF),
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
