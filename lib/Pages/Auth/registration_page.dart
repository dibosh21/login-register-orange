import 'package:flutter/material.dart';
import 'package:interview/Component/Http/http.dart';
import 'package:interview/MaterialApp/colors.dart';
import 'package:interview/MaterialApp/routes.dart';
import 'package:interview/Pages/Auth/Controller/api.dart';
import 'package:interview/Widgets/custom_button.dart';
import 'package:interview/Widgets/input_field.dart';
import 'package:interview/Widgets/logo_in_orange_box_header_with_title.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static String name = 'RegistrationPage';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Text Editing Controller
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // VERIFICATION AND SUBMIT
  verifyAndSubmitRegisterForm() async {
    // Check Full Name is Entered
    bool fullName = fullNameController.text != '';
    if (fullName == false) {
      // message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter your Full Name'), elevation: 5, duration: Duration(seconds: 2)),
      );

      return;
    }

    // Check email is valid
    bool email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailAddressController.text);
    if (email == false) {
      // message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email address'), elevation: 5, duration: Duration(seconds: 2)),
      );
      return;
    }

    // Check Mobile Number is Entered
    bool phoneNumber = phoneNumberController.text != '';
    if (phoneNumber == false) {
      // message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter your Phone Number'), elevation: 5, duration: Duration(seconds: 2)),
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
    HttpModel data = await API.register(context, body: {
      'fullname': fullNameController.text,
      'email': emailAddressController.text,
      'phonenumber': phoneNumberController.text,
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
            const LogoInOrangeBoxHeaderWithTitle(title: 'REGISTER'),

            // Form Elements
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 35, right: 35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Input
                    CustomInputField(
                      hintText: 'Fullname',
                      iconData: Icons.people,
                      keyboardType: TextInputType.emailAddress,
                      controller: fullNameController,
                      margin: const EdgeInsets.only(bottom: 18),
                    ),

                    // Input
                    CustomInputField(
                      hintText: 'Email',
                      iconData: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailAddressController,
                      margin: const EdgeInsets.only(bottom: 18),
                    ),

                    // Input
                    CustomInputField(
                      hintText: 'Phone Number',
                      iconData: Icons.phone,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: phoneNumberController,
                      margin: const EdgeInsets.only(bottom: 18),
                    ),

                    // Input
                    CustomInputField(
                      hintText: 'Password',
                      iconData: Icons.vpn_key,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: passwordController,
                      margin: const EdgeInsets.only(bottom: 18),
                    ),

                    const Spacer(),

                    // Button Submit
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        buttonText: 'REGISTER',
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          await verifyAndSubmitRegisterForm();
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
                            'Already a member?',
                            style: TextStyle(
                              color: COLOR.greyTextHint,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.loginPage);
                            },
                            child: Text(
                              'Login',
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
