import 'package:app_bjumper_bak/src/core/extensions/context.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/home_screen.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

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
    return Scaffold(
      backgroundColor: BjumperColors.splashScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/icons/bjumperLogo.svg',
              fit: BoxFit.cover,
              alignment: AlignmentDirectional.center,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 4000));
    if (!mounted) return;

    context.pushReplacement(HomeScreen());
    return;
  }
}
