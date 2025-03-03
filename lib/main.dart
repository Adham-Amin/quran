import 'package:flutter/material.dart';
import 'package:quran/constants_data.dart';
import 'package:quran/models/sura_model.dart';
import 'package:quran/ui/screens/home/home_screen.dart';
import 'package:quran/ui/screens/splash/splash_screen.dart';
import 'package:quran/ui/screens/sura_details/sura_details.dart';

void main() {
  for (int i = 0; i < 114; i++) {
    ConstantsData.suras.add(
      SuraModel(
        nameAr: ConstantsData.arabicAuranSuras[i],
        nameEn: ConstantsData.englishQuranSurahs[i],
        content: '${i + 1}.txt',
        verses: ConstantsData.ayaNumber[i],
      ),
    );
  }
  runApp(const Quran());
}

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
