import 'package:flutter/material.dart';
import 'package:interview/MaterialApp/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.borderRadius,
  }) : super(key: key);

  final String buttonText;
  final Function onPressed;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: Colors.black54,
      borderRadius: borderRadius ?? BorderRadius.circular(50),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(50),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: const [0.1, 0.9],
              colors: [
                COLOR.primary,
                COLOR.secondary,
              ],
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: COLOR.white.withOpacity(0.2),
              onTap: () => onPressed(),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: COLOR.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
