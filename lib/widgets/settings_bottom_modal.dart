import 'package:flutter/material.dart';
import 'package:food_picker/widgets/add_food_choice_bottom_modal.dart';
import 'package:food_picker/widgets/add_food_vendor_bottom_modal.dart';
import 'package:food_picker/widgets/add_vendor_picker_bottom_modal.dart';
import 'package:food_picker/widgets/remove_food_choice_bottom_modal.dart';
import 'package:food_picker/widgets/remove_food_vendor_bottom_modal.dart';
import 'package:food_picker/widgets/remove_vendor_picker_bottom_modal.dart';
import 'package:food_picker/widgets/settings_action_item.dart';

/// Bottom modal to CRUD data.
class SettingsBottomModal extends StatelessWidget {
  const SettingsBottomModal({
    Key? key,
    required this.addVendorPicker,
    required this.removeVendorPicker,
    required this.addFoodVendor,
    required this.removeFoodVendor,
    required this.addFoodChoice,
    required this.removeFoodChoice,
  }) : super(key: key);

  final void Function(String) addVendorPicker;
  final void Function(String) removeVendorPicker;
  final void Function(String, String) addFoodVendor;
  final void Function(String, String) removeFoodVendor;
  final void Function(String, String) addFoodChoice;
  final void Function(String, String) removeFoodChoice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsActionItem(
          bottomModal: AddVendorPickerBottomModal(
            addVendorPicker: addVendorPicker,
          ),
          iconData: Icons.add_circle_rounded,
          text: 'Add vendor picker',
        ),
        const Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
        SettingsActionItem(
          bottomModal: RemoveVendorPickerBottomModal(
            removeVendorPicker: removeVendorPicker,
          ),
          iconData: Icons.remove_circle_rounded,
          text: 'Remove vendor picker',
        ),
        const Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
        SettingsActionItem(
          bottomModal: AddFoodVendorBottomModal(
            addFoodVendor: addFoodVendor,
          ),
          iconData: Icons.add_circle_rounded,
          text: 'Add food vendor',
        ),
        const Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
        SettingsActionItem(
          bottomModal: RemoveFoodVendorBottomModal(
            removeFoodVendor: removeFoodVendor,
          ),
          iconData: Icons.remove_circle_rounded,
          text: 'Remove food vendor',
        ),
        const Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
        SettingsActionItem(
          bottomModal: AddFoodChoiceBottomModal(
            addFoodChoice: addFoodChoice,
          ),
          iconData: Icons.add_circle_rounded,
          text: 'Add food choice',
        ),
        const Divider(height: 3.0, color: Color(0xFFFFFFFF), thickness: 0.7),
        SettingsActionItem(
          bottomModal: RemoveFoodChoiceBottomModal(
            removeFoodChoice: removeFoodChoice,
          ),
          iconData: Icons.remove_circle_rounded,
          text: 'Remove food choice',
        ),
      ],
    );
  }
}
