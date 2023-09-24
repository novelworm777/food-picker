import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/services/local_storage_service.dart';
import 'app_drop_down.dart';

class RemoveVendorPickerBottomModal extends StatefulWidget {
  const RemoveVendorPickerBottomModal({
    super.key,
    required this.removeVendorPicker,
  });

  final void Function(String) removeVendorPicker;

  @override
  State<RemoveVendorPickerBottomModal> createState() =>
      _RemoveVendorPickerBottomModalState();
}

class _RemoveVendorPickerBottomModalState
    extends State<RemoveVendorPickerBottomModal> {
  final _local = LocalStorageService();
  List<String> _vendorPickers = [];
  String _pickerName = "";

  @override
  void initState() {
    super.initState();
    _getVendorPickers();
  }

  void _getVendorPickers() async {
    final res = await _local.getVendorPickers();
    setState(() {
      _vendorPickers = res;
      _pickerName = _vendorPickers.isNotEmpty ? _vendorPickers.first : "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        color: const Color(0xFF0097A7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppDropDown(
              items: _vendorPickers,
              onChanged: (value) {
                setState(
                  () {
                    _pickerName = value ?? _pickerName;
                  },
                );
              },
              value: _pickerName,
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
                widget.removeVendorPicker(_pickerName);
                Navigator.pop(context);
              },
              child: Text(
                'Delete',
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
      ),
    );
  }
}
