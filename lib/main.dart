import 'package:flutter/material.dart';
import 'package:interview/MaterialApp/material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Omit gradiant dithering
  Paint.enableDithering = true;

  // Run App
  runApp(const MyInterviewApp());
}
