import 'package:app_bjumper_bak/src/presentation/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bjumper test',
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen()
        // '/': (_) => const HomeScreen(),
      },
    );
  }
}
