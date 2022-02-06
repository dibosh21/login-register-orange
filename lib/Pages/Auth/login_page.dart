import 'package:flutter/material.dart';
import 'package:interview/Component/Http/http.dart';
import 'package:interview/MaterialApp/colors.dart';
import 'package:interview/MaterialApp/routes.dart';
import 'package:interview/Pages/Auth/Controller/api.dart';
import 'package:interview/Widgets/custom_button.dart';
import 'package:interview/Widgets/input_field.dart';
import 'package:interview/Widgets/logo_in_orange_box_header_with_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String name = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Editing Controller
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // VERIFICATION AND SUBMIT
  verifyAndSubmitLoginForm() async {
    // Check email is valid
    bool email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailAddressController.text);
    if (email == false) {
      // message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email address'), elevation: 5, duration: Duration(seconds: 2)),
      );
      return;
    }

    // Check Password is Entered
    bool pass = passwordController.text != '';
    if (pass == false) {
      // message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Field is Empty'), elevation: 5, duration: Duration(seconds: 2)),
      );

      return;
    }

    // HTTP CALLBACK
    HttpModel data = await API.login(context, body: {
      'email': emailAddressController.text,
      'password': passwordController.text,
    });

    // message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${data.body['message']}'), elevation: 5, duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            // Header
            const LogoInOrangeBoxHeaderWithTitle(title: 'Login'),

            // Form Elements
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 35, right: 35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Input
                    CustomInputField(
                      hintText: 'Email',
                      iconData: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailAddressController,
                    ),

                    // Input
                    CustomInputField(
                      hintText: 'Password',
                      iconData: Icons.vpn_key,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: passwordController,
                      margin: const EdgeInsets.only(bottom: 10),
                    ),

                    // Button Forgot
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: COLOR.greyTextHint),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Button Submit
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        buttonText: 'LOGIN',
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          await verifyAndSubmitLoginForm();

                          // Output
                        },
                      ),
                    ),

                    const Spacer(),

                    // Button Register
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: COLOR.greyTextHint,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.registrationPage);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: COLOR.primary),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
