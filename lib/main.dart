import 'package:flutter/material.dart';
import 'package:quran/ui/screens/home/home_screen.dart';
import 'package:quran/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const Quran());
}

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}