import 'package:shared_preferences/shared_preferences.dart';

/// Service to local storage.
class LocalStorageService {
  /// Add new vendor picker.
  Future<void> addVendorPicker(String pickerName) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> pickers = (prefs.getStringList("vendor_pickers") ?? [])
      ..add(pickerName);
    await prefs.setStringList("vendor_pickers", pickers);
  }

  /// Get all vendor pickers.
  Future<List<String>> getVendorPickers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("vendor_pickers") ?? [];
  }

  /// Remove a vendor picker and all vendor and choice data related to it.
  Future<void> removeVendorPicker(String pickerName) async {
    final prefs = await SharedPreferences.getInstance();
    // remove from pickers data
    final List<String> pickers = (prefs.getStringList("vendor_pickers") ?? [])
      ..remove(pickerName);
    await prefs.setStringList("vendor_pickers", pickers);
    // remove all vendors data of picker
    final vendorsKey = '${pickerName}_vendors';
    final List<String> vendors = prefs.getStringList(vendorsKey) ?? [];
    await prefs.remove(vendorsKey);
    // remove all choices data of vendors
    for (String vendorName in vendors) {
      final choicesKey = '${vendorName}_choices';
      await prefs.remove(choicesKey);
    }
  }

  /// Add new food vendor of a vendor picker.
  Future<void> addFoodVendor(String pickerName, String vendorName) async {
    final prefs = await SharedPreferences.getInstance();
    final vendorsKey = '${pickerName}_vendors';
    final List<String> vendors = (prefs.getStringList(vendorsKey) ?? [])
      ..add(vendorName);
    await prefs.setStringList(vendorsKey, vendors);
  }

  /// Get all food vendors of a vendor picker.
  Future<List<String>> getFoodVendors(String pickerName) async {
    final prefs = await SharedPreferences.getInstance();
    final vendorsKey = '${pickerName}_vendors';
    return prefs.getStringList(vendorsKey) ?? [];
  }

  /// Remove a food vendor and all choice data related to it.
  Future<void> removeFoodVendor(String pickerName, String vendorName) async {
    final prefs = await SharedPreferences.getInstance();
    // remove from vendors data
    final vendorsKey = '${pickerName}_vendors';
    final List<String> pickers = (prefs.getStringList(vendorsKey) ?? [])
      ..remove(vendorName);
    await prefs.setStringList(vendorsKey, pickers);
    // remove all choices data of vendor
    final choicesKey = '${vendorName}_choices';
    await prefs.remove(choicesKey);
  }

  /// Add new food choice of a food vendor.
  Future<void> addFoodChoice(String vendorName, String choiceName) async {
    final prefs = await SharedPreferences.getInstance();
    final choicesKey = '${vendorName}_choices';
    final List<String> choices = (prefs.getStringList(choicesKey) ?? [])
      ..add(choiceName);
    await prefs.setStringList(choicesKey, choices);
  }

  /// Get all food choices of a food vendor.
  Future<List<String>> getFoodChoices(String vendorName) async {
    final prefs = await SharedPreferences.getInstance();
    final choicesKey = '${vendorName}_choices';
    return prefs.getStringList(choicesKey) ?? [];
  }

  /// Remove a food choice of a food vendor.
  Future<void> removeFoodChoice(String vendorName, String choiceName) async {
    final prefs = await SharedPreferences.getInstance();
    final choicesKey = '${vendorName}_choices';
    final List<String> choices = (prefs.getStringList(choicesKey) ?? [])
      ..remove(choiceName);
    await prefs.setStringList(choicesKey, choices);
  }
}
