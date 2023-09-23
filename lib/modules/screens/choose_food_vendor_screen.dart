import 'package:flutter/material.dart';

import '../../utils/services/local_storage_service.dart';
import '../models/vendor_picker_choice.dart';

class ChooseVendorPickerScreen extends StatefulWidget {
  const ChooseVendorPickerScreen({super.key});

  @override
  State<ChooseVendorPickerScreen> createState() =>
      _ChooseVendorPickerScreenState();
}

class _ChooseVendorPickerScreenState extends State<ChooseVendorPickerScreen> {
  final _local = LocalStorageService();
  List<String> _vendorPickers = [];

  @override
  void initState() {
    super.initState();
    _getVendorPickers();
  }

  Future<void> _getVendorPickers() async {
    setState(() async {
      _vendorPickers = await _local.getVendorPickers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xFF607D8B),
          height: screenHeight,
          width: screenWidth,
          child: Center(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return VendorPickerChoice(text: _vendorPickers[index]);
              },
              itemCount: _vendorPickers.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 37.0),
              shrinkWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
