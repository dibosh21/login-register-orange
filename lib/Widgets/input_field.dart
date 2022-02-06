import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview/MaterialApp/colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.iconData,
    this.obscureText = false,
    this.inputFormatters,
    this.margin,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final IconData? iconData;
  final bool obscureText;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 25),
      child: Material(
        elevation: 6,
        shadowColor: Colors.black38,
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.only(top: 8, left: 20, right: 8),
          child: TextFormField(
            validator: (value) {
              if (value != null) {
                return value.isEmpty ? 'Email cannot be blank' : null;
              }
            },
            // onSaved: (value) => _email = value,
            controller: controller,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            maxLength: 100,
            maxLines: 1,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            autocorrect: false,
            cursorColor: Colors.grey,
            cursorWidth: 1.5,
            cursorHeight: 20,
            style: TextStyle(
              color: COLOR.inputText,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              filled: false,
              hintText: hintText ?? '',
              hintStyle: TextStyle(color: COLOR.inputTextHint),
              icon: Icon(iconData, color: COLOR.inputTextHint),
              contentPadding: const EdgeInsets.only(left: 5),
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
