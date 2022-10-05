import 'package:flutter/material.dart';

class LogoAnimation extends StatelessWidget {
  final Image imageUsed;

  const LogoAnimation({Key? key, required this.imageUsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      builder: (BuildContext context, double _val, Widget? child) {
        return Opacity(
          opacity: _val,
          child: child,
        );
      },
      duration: Duration(seconds: 5),
      tween: Tween<double>(begin: 0, end: 1),
      child: imageUsed,
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  final String scaleText;

  const ScaleAnimation({Key? key, required this.scaleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        builder: (BuildContext context, double _size, Widget? child) =>
            Text(scaleText, style: TextStyle(fontSize: _size)),
        duration: Duration(seconds: 3),
        tween: Tween<double>(begin: 0, end: 1),
        child: Text(
          scaleText,
          style: TextStyle(
              fontSize: 6, color: Colors.yellow, fontWeight: FontWeight.bold),
        ));
  }
}

