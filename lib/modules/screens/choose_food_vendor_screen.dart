import 'package:flutter/material.dart';
import 'package:food_picker/modules/models/vendor_picker_choice.dart';

class ChooseFoodVendorScreen extends StatelessWidget {
  ChooseFoodVendorScreen({super.key});

  final _vendor_choices = ['BCA', 'BSD'];

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
                return VendorPickerChoice(text: _vendor_choices[index]);
              },
              itemCount: _vendor_choices.length,
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
