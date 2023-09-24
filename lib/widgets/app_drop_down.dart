import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
  });

  final List<String> items;
  final void Function(String?) onChanged;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 13.0),
      child: SizedBox(
        height: 37.0,
        child: DropdownButton(
          dropdownColor: const Color(0xFF0097A7),
          iconEnabledColor: const Color(0xFFFFFFFF),
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem(
                  alignment: Alignment.center,
                  value: item,
                  child: Text(
                    item,
                    style: GoogleFonts.jetBrainsMono(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          underline: Container(height: 1, color: const Color(0xFFFFFFFF)),
          value: value,
        ),
      ),
    );
  }
}
