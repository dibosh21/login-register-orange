import 'package:flutter/material.dart';
import 'package:interview/Widgets/logo_in_orange_box.dart';

class LogoInOrangeBoxHeaderWithTitle extends StatefulWidget {
  const LogoInOrangeBoxHeaderWithTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LogoInOrangeBoxHeaderWithTitle> createState() => _LogoInOrangeBoxHeaderWithTitleState();
}

class _LogoInOrangeBoxHeaderWithTitleState extends State<LogoInOrangeBoxHeaderWithTitle> {
  // Get Full Width
  double get screenWidth => MediaQuery.maybeOf(context)?.size.width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenWidth * 0.80,
      child: LogoInOrangeBox(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(screenWidth * 0.3)),
        logoSizeRatio: 6,
        child: Positioned(
          bottom: 60,
          right: 35,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
