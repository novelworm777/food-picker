import 'package:flutter/material.dart';

void main() {
  runApp(const FoodPicker());
}

class FoodPicker extends StatelessWidget {
  const FoodPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}

