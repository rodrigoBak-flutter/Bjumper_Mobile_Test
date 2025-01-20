import 'package:app_bjumper_bak/src/presentation/shared/animations/pump_animation.dart';
import 'package:flutter/material.dart';

class BjumperAnimation extends StatelessWidget {
  final int duration;
  final double startSize;
  final double endSize;
  final Curve curve;
  final String asset;

  const BjumperAnimation({
    super.key,
    this.duration = 2000,
    this.startSize = 50,
    this.endSize = 100,
    this.asset = 'assets/icons/bjumperLogo.svg',
    this.curve = Curves.easeInOutQuart,
  });
  @override
  Widget build(BuildContext context) {
    return PumpAnimation(
      duration: duration,
      startSize: startSize,
      endSize: endSize,
      curve: curve,
      asset: asset,
    );
  }
}
