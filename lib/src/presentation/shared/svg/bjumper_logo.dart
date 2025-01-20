import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BjumperLogo extends StatelessWidget {
  const BjumperLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/bjumperLogo.svg',
      fit: BoxFit.cover,
      alignment: AlignmentDirectional.center,
    );
  }
}
