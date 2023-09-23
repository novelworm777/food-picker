import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Action item for settings.
class SettingsActionItem extends StatelessWidget {
  const SettingsActionItem({
    super.key,
    required this.bottomModal,
    required this.iconData,
    required this.text,
  });

  final Widget bottomModal;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBarModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: bottomModal,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21.0,
          vertical: 13.0,
        ),
        child: Row(
          children: [
            Icon(iconData, color: const Color(0xFF0097A7)),
            const SizedBox(width: 13.0),
            Text(
              text,
              style: GoogleFonts.jetBrainsMono(
                color: const Color(0xFFFFFFFF),
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
