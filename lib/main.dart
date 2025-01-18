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
      initialRoute: '',
      routes: {
        // '/': (_) => const HomeScreen(),
      },
    );
  }
}
