import 'package:flutter/material.dart';
import 'package:form_steward_example/custom_stepper_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DynamicFormPage(),
    );
  }
}