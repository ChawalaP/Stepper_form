import 'package:flutter/material.dart';
import 'pages/form_page/stepper_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Form with Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Stepper_Form(),
    );
  }
}
