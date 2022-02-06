import 'package:flutter/material.dart';
import 'package:interview/MaterialApp/routes.dart';

class MyInterviewApp extends StatelessWidget {
  const MyInterviewApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview App',
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: true,
      routes: routes,
      initialRoute: Routes.loginPage,
    );
  }
}
