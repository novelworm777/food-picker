import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/services/local_storage_service.dart';
import 'app_drop_down.dart';

class RemoveFoodChoiceBottomModal extends StatefulWidget {
  const RemoveFoodChoiceBottomModal({
    super.key,
    required this.removeFoodChoice,
  });

  final void Function(String, String) removeFoodChoice;

  @override
  State<RemoveFoodChoiceBottomModal> createState() =>
      _RemoveFoodChoiceBottomModalState();
}

class _RemoveFoodChoiceBottomModalState
    extends State<RemoveFoodChoiceBottomModal> {
  final _local = LocalStorageService();
  List<String> _vendorPickers = [];
  String _pickerName = "";
  List<String> _foodVendors = [];
  String _vendorName = "";
  List<String> _foodChoices = [];
  String _foodName = "";

  @override
  void initState() {
    super.initState();
    _getLocalData();
  }

  void _getLocalData() async {
    await _getVendorPickers();
    await _getFoodVendors();
    await _getFoodChoices();
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

  Future<void> _getFoodChoices() async {
    final res = await _local.getFoodChoices(_vendorName);
    setState(() {
      _foodChoices = res;
      _foodName = _foodChoices.isNotEmpty ? _foodChoices.first : "";
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
              onChanged: (value) async {
                setState(
                  () {
                    _vendorName = value ?? _vendorName;
                  },
                );
                await _getFoodChoices();
              },
              value: _vendorName,
            ),
            AppDropDown(
              items: _foodChoices,
              onChanged: (value) {
                setState(
                  () {
                    _foodName = value ?? _foodName;
                  },
                );
              },
              value: _foodName,
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
                widget.removeFoodChoice(_vendorName, _foodName);
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
