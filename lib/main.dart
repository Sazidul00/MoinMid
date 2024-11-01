import 'package:flutter/material.dart';
import 'animation.dart';
import 'package:get/get.dart';// Ensure you have this file named ripple.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Ripple(),
    );
  }
}