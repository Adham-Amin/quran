import 'package:flutter/material.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> sebha = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا إله إلا الله',
    'استغفر الله',
  ];
  
  int count = 0;
  int index = 0;
  double turns = 0.0;

  void _incrementCounter() {
    setState(() {
      count++;
      turns += 1 / 33;
    });

    if (count == 33) {
      setState(() {
        count = 0;
        index = (index + 1) % sebha.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundSebha),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Image.asset(
                AppAssets.logo,
                height: 126,
                width: 300,
              ),
              const SizedBox(height: 16),
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: AppStyles.whiteBold16.copyWith(fontSize: 36),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: _incrementCounter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: Image.asset(AppAssets.imSebha),
                    ),
                    Positioned(
                      top: 200,
                      child: Column(
                        children: [
                          Text(
                            sebha[index],
                            style: AppStyles.whiteBold16.copyWith(fontSize: 36),
                          ),
                          Text(
                            '$count',
                            style: AppStyles.whiteBold16.copyWith(fontSize: 36),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
