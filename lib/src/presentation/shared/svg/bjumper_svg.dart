import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BjumperSvg extends StatelessWidget {
  const BjumperSvg({super.key, required this.svgBjumperName});
  final String svgBjumperName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgBjumperName,
      fit: BoxFit.cover,
      alignment: AlignmentDirectional.center,
      color: BjumperColors.primary,
    );
  }
}
