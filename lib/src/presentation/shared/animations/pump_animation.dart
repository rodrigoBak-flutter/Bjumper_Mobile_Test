import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PumpAnimation extends StatefulWidget {
  final int duration;
  final double startSize;
  final double endSize;
  final Curve curve;
  final String asset;

  const PumpAnimation({
    super.key,
    required this.duration,
    required this.startSize,
    required this.endSize,
    required this.curve,
    required this.asset,
  });

  @override
  State<PumpAnimation> createState() => _PumpAnimationState();
}

class _PumpAnimationState extends State<PumpAnimation>
    with SingleTickerProviderStateMixin {
  late final sizeAnimationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.duration));

  late final sizeAnimation =
      Tween<double>(begin: widget.startSize, end: widget.endSize)
          .chain(CurveTween(curve: widget.curve))
          .animate(sizeAnimationController);

  @override
  void initState() {
    super.initState();
    sizeAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    sizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: sizeAnimationController,
        builder: (context, _) {
          return SvgPicture.asset(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              widget.asset);
        });
  }
}
