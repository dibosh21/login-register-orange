import 'package:flutter/material.dart';
import 'package:interview/Pages/Auth/login_page.dart';
import 'package:interview/Pages/Auth/registration_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.loginPage: (context) => const LoginPage(),
  Routes.registrationPage: (context) => const RegistrationPage(),
};

class Routes {
  static String loginPage = LoginPage.name;
  static String registrationPage = RegistrationPage.name;
}
