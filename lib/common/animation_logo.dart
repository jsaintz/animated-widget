import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  static final _opactityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);
  static final _rotateTween = Tween<double>(begin: 0.0, end: 12.0);

  const AnimatedLogo({Key? key, required Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
      child: Transform.rotate(
        angle: _rotateTween.evaluate(animation),
        child: Opacity(
          opacity: _opactityTween.evaluate(animation),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
