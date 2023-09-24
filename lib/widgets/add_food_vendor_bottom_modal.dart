import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/services/local_storage_service.dart';
import 'app_drop_down.dart';
import 'app_text_field.dart';

class AddFoodVendorBottomModal extends StatefulWidget {
  const AddFoodVendorBottomModal({
    super.key,
    required this.addFoodVendor,
  });

  final void Function(String, String) addFoodVendor;

  @override
  State<AddFoodVendorBottomModal> createState() =>
      _AddFoodVendorBottomModalState();
}

class _AddFoodVendorBottomModalState extends State<AddFoodVendorBottomModal> {
  final _local = LocalStorageService();
  List<String> _vendorPickers = [];
  String _pickerName = "";
  String _vendorName = "";

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
            AppTextField(
              labelText: 'Vendor Name',
              onChanged: (value) {
                setState(() {
                  _vendorName = value;
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
                widget.addFoodVendor(_pickerName, _vendorName);
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
      ),
    );
  }
}
