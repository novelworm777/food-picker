import 'package:flutter/material.dart';

import 'config/routes/app_router.dart';
import 'config/routes/routes.dart';

void main() {
  runApp(const FoodPicker());
}

class FoodPicker extends StatelessWidget {
  const FoodPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      onGenerateRoute: AppRouter.generateRoute,
      title: 'Food Picker',
    );
  }
}

