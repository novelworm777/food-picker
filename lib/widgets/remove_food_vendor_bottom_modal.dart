import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/services/local_storage_service.dart';
import 'app_drop_down.dart';

class RemoveFoodVendorBottomModal extends StatefulWidget {
  const RemoveFoodVendorBottomModal({
    super.key,
    required this.removeFoodVendor,
  });

  final void Function(String, String) removeFoodVendor;

  @override
  State<RemoveFoodVendorBottomModal> createState() =>
      _RemoveFoodVendorBottomModalState();
}

class _RemoveFoodVendorBottomModalState
    extends State<RemoveFoodVendorBottomModal> {
  final _local = LocalStorageService();
  List<String> _vendorPickers = [];
  String _pickerName = "";
  List<String> _foodVendors = [];
  String _vendorName = "";

  @override
  void initState() {
    super.initState();
    _getLocalData();
  }

  void _getLocalData() async {
    await _getVendorPickers();
    await _getFoodVendors();
  }

  Future<void> _getVendorPickers() async {
    final res = await _local.getVendorPickers();
    setState(() {
      _vendorPickers = res;
      _pickerName = _vendorPickers.isNotEmpty ? _vendorPickers.first : "";
    });
  }

  Future<void> _getFoodVendors() async {
    final res = await _local.getFoodVendors(_pickerName);
    setState(() {
      _foodVendors = res;
      _vendorName = _foodVendors.isNotEmpty ? _foodVendors.first : "";
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
              onChanged: (value) async {
                setState(
                  () {
                    _pickerName = value ?? _pickerName;
                  },
                );
                await _getFoodVendors();
              },
              value: _pickerName,
            ),
            AppDropDown(
              items: _foodVendors,
              onChanged: (value) {
                setState(
                  () {
                    _vendorName = value ?? _vendorName;
                  },
                );
              },
              value: _vendorName,
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
                widget.removeFoodVendor(_pickerName, _vendorName);
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
