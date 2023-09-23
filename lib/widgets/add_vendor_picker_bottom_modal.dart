import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_text_field.dart';

class AddVendorPickerBottomModal extends StatefulWidget {
  const AddVendorPickerBottomModal({
    super.key,
    required this.addVendorPicker,
  });

  final void Function(String) addVendorPicker;

  @override
  State<AddVendorPickerBottomModal> createState() =>
      _AddVendorPickerBottomModalState();
}

class _AddVendorPickerBottomModalState
    extends State<AddVendorPickerBottomModal> {
  String _pickerName = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0097A7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            labelText: 'Vendor Name',
            onChanged: (value) {
              setState(() {
                _pickerName = value;
              });
            },
          ),
          const SizedBox(height: 13.0),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xFFFFFFFF),
                strokeAlign: StrokeAlign.center,
              ),
            ),
            onPressed: () {
              widget.addVendorPicker(_pickerName);
              Navigator.pop(context);
            },
            child: Text(
              'Create',
              style: GoogleFonts.jetBrainsMono(
                color: const Color(0xFFFFFFFF),
                fontSize: 17.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 13.0),
        ],
      ),
    );
  }
}
