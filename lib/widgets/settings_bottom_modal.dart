import 'package:flutter/material.dart';
import 'package:food_picker/widgets/add_vendor_picker_bottom_modal.dart';
import 'package:food_picker/widgets/settings_action_item.dart';

/// Bottom modal to CRUD data.
class SettingsBottomModal extends StatelessWidget {
  const SettingsBottomModal({
    Key? key,
    required this.addVendorPicker,
  }) : super(key: key);

  final void Function(String) addVendorPicker;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 321,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsActionItem(
            bottomModal: AddVendorPickerBottomModal(
              addVendorPicker: addVendorPicker,
            ),
            iconData: Icons.add_circle_rounded,
            text: 'Add vendor picker',
          ),
          Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
          SettingsActionItem(
            bottomModal: SizedBox(height: 300),
            iconData: Icons.remove_circle_rounded,
            text: 'Remove vendor picker',
          ),
          Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
          SettingsActionItem(
            bottomModal: SizedBox(height: 300),
            iconData: Icons.add_circle_rounded,
            text: 'Add food vendor',
          ),
          Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
          SettingsActionItem(
            bottomModal: SizedBox(height: 300),
            iconData: Icons.remove_circle_rounded,
            text: 'Remove food vendor',
          ),
          Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
          SettingsActionItem(
            bottomModal: SizedBox(height: 300),
            iconData: Icons.add_circle_rounded,
            text: 'Add food choice',
          ),
          Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
          SettingsActionItem(
            bottomModal: SizedBox(height: 300),
            iconData: Icons.remove_circle_rounded,
            text: 'Remove food choice',
          ),
        ],
      ),
    );
  }
}
