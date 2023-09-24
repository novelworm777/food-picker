import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_picker/widgets/food_vendor_bottom_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utils/services/local_storage_service.dart';
import '../../widgets/settings_bottom_modal.dart';
import '../../widgets/vendor_picker_choice.dart';

class ChooseVendorPickerScreen extends StatefulWidget {
  const ChooseVendorPickerScreen({super.key});

  @override
  State<ChooseVendorPickerScreen> createState() =>
      _ChooseVendorPickerScreenState();
}

class _ChooseVendorPickerScreenState extends State<ChooseVendorPickerScreen> {
  final _local = LocalStorageService();
  List<String> _vendorPickers = [];
  final Map<String, List<String>> _foodVendors = {};

  @override
  void initState() {
    super.initState();
    _getLocalData();
  }

  void _getLocalData() async {
    await _getVendorPickers();
    for (String pickerName in _vendorPickers) {
      await _getFoodVendors(pickerName);
    }
  }

  Future<void> _getVendorPickers() async {
    final res = await _local.getVendorPickers();
    setState(() {
      _vendorPickers = res;
    });
  }

  Future<void> _getFoodVendors(String pickerName) async {
    final res = await _local.getFoodVendors(pickerName);
    setState(() {
      _foodVendors[pickerName] = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        child: Scaffold(
          body: Container(
            color: const Color(0xFF607D8B),
            height: screenHeight,
            width: screenWidth,
            child: Center(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final pickerName = _vendorPickers[index];
                  return VendorPickerChoice(
                    onTap: () {
                      final foodVendors = _foodVendors[pickerName] ?? [];
                      if (foodVendors.isNotEmpty) {
                        final random = Random().nextInt(foodVendors.length);
                        final vendorName = foodVendors[random];
                        showBarModalBottomSheet(
                          context: context,
                          builder: (context) => FoodVendorBottomModal(
                            vendorName: vendorName,
                          ),
                          expand: true,
                        );
                      }
                    },
                    text: pickerName,
                  );
                },
                itemCount: _vendorPickers.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 37.0),
                shrinkWrap: true,
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () => showBarModalBottomSheet(
              backgroundColor: const Color(0xFFBDBDBD),
              context: context,
              builder: (context) => SettingsBottomModal(
                addVendorPicker: _addVendorPicker,
                removeVendorPicker: _removeVendorPicker,
                addFoodVendor: _addFoodVendor,
                removeFoodVendor: _removeFoodVendors,
              ),
            ),
            child: const Icon(
              Icons.settings,
              color: Color(0xFFBDBDBD),
              size: 33.0,
            ),
          ),
        ),
      ),
    );
  }

  void _addVendorPicker(String pickerName) async {
    await _local.addVendorPicker(pickerName);
    setState(() {
      _vendorPickers.add(pickerName);
    });
  }

  void _removeVendorPicker(String pickerName) async {
    await _local.removeVendorPicker(pickerName);
    setState(() {
      _vendorPickers.remove(pickerName);
    });
  }

  void _addFoodVendor(String pickerName, String vendorName) async {
    await _local.addFoodVendor(pickerName, vendorName);
    setState(() {
      _foodVendors[pickerName]?.add(vendorName);
    });
  }

  void _removeFoodVendors(String pickerName, String vendorName) async {
    await _local.removeFoodVendor(pickerName, vendorName);
    setState(() {
      _foodVendors[pickerName]?.remove(vendorName);
    });
  }
}
