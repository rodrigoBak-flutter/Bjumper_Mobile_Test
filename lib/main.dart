import 'package:app_bjumper_bak/src/app/routes/app_routes.dart';
import 'package:app_bjumper_bak/src/presentation/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bjumper test',
      theme: ThemeData.light(useMaterial3: true),
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
