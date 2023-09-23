import 'package:flutter/material.dart';
import 'package:food_picker/modules/screens/choose_food_vendor_screen.dart';

import 'routes.dart';

/// Route generator.
///
/// Reference from [Stack Overflow](https://stackoverflow.com/a/63220116).
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.chooseFoodVendorScreen:
        return MaterialPageRoute(builder: (_) => ChooseVendorPickerScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
