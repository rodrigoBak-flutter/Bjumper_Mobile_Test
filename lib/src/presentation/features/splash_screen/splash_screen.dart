import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bjumper_bak/src/core/extensions/context.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/home_screen.dart';
import 'package:app_bjumper_bak/src/presentation/shared/svg/bjumper_svg.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BjumperColors.splashScreen,
      body: Center(
          child: BjumperSvg(svgBjumperName: 'assets/icons/bjumperLogo.svg')),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 4000));
    if (!mounted) return;

    context.pushReplacement(const HomeScreen());
    return;
  }
}
