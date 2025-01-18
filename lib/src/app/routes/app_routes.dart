import 'package:flutter/material.dart';
import 'package:app_bjumper_bak/src/presentation/features/splash_screen/splash_screen.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/home_screen.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case SplashScreen.routeName:
        return _getRoute(page: const SplashScreen());
      case SplashScreen.routeName:
        return _getRoute(page: HomeScreen());

      default:
        return _getRoute(page: HomeScreen());
    }
  }

  static MaterialPageRoute<T> _getRoute<T>({required Widget page}) =>
      MaterialPageRoute<T>(builder: (ctx) => page);

  static Route<T> getAnimatedRoute<T>({required Widget page}) {
    return PageRouteBuilder(
        pageBuilder: (ctx, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 350),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;

          const curve = Curves.easeInBack;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }
}
