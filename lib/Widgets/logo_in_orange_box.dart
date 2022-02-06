import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:interview/MaterialApp/colors.dart';

class LogoInOrangeBox extends StatelessWidget {
  const LogoInOrangeBox({
    Key? key,
    this.borderRadius,
    this.child,
    this.logoSizeRatio = 10,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final num logoSizeRatio;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.zero,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.9],
          colors: [
            COLOR.primary,
            COLOR.secondary,
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: (MediaQuery.of(context).size.width / 25) * logoSizeRatio,
              height: (MediaQuery.of(context).size.height / 25) * logoSizeRatio,
            ),
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}
