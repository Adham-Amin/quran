import 'package:flutter/material.dart';
import 'package:quran/ui/screens/home/tabs/hadith/hadith_tab.dart';
import 'package:quran/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:quran/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:quran/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:quran/ui/screens/home/tabs/times/times_tab.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexSelected = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[indexSelected],
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Theme _buildBottomBar() {
    return Theme(
      data: ThemeData(
        canvasColor: AppColors.primary,
      ),
      child: BottomNavigationBar(
        onTap: (newSelected) => setState(() {
          indexSelected = newSelected;
        }),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        currentIndex: indexSelected,
        items: [
          BottomNavigationBarItem(
            label: 'Quran',
            icon: Image.asset(
              AppAssets.icQuran,
              width: 24,
              color: indexSelected == 0 ? AppColors.white : AppColors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Hadith',
            icon: Image.asset(
              AppAssets.icHadith,
              width: 24,
              color: indexSelected == 1 ? AppColors.white : AppColors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Sebha',
            icon: Image.asset(
              AppAssets.icSebha,
              width: 24,
              color: indexSelected == 2 ? AppColors.white : AppColors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Radio',
            icon: Image.asset(
              AppAssets.icRadio,
              width: 24,
              color: indexSelected == 3 ? AppColors.white : AppColors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Times',
            icon: Image.asset(
              AppAssets.icTimes,
              width: 24,
              color: indexSelected == 4 ? AppColors.white : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
