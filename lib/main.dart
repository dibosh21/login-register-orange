import 'package:flutter/material.dart';
import 'package:interview/MaterialApp/material_app.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Keep device awake
  Wakelock.enable();

  // Omit gradiant dithering
  Paint.enableDithering = true;

  // Run App
  runApp(const MyInterviewApp());
}
