import 'package:flutter/material.dart';
import 'package:quran/constants_data.dart';
import 'package:quran/models/sura_model.dart';
import 'package:quran/ui/screens/sura_details/sura_details.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_colors.dart';

class SuraDetailsItem extends StatelessWidget {
  const SuraDetailsItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        SuraDetails.routeName,
        arguments: SuraModel(
          arName: ConstantsData.arabicAuranSuras[index],
          enName: ConstantsData.englishQuranSurahs[index],
          content: '${index + 1}.txt',
        ),
      ),
      child: Row(
        spacing: 24,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.imSuraNumber,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ConstantsData.englishQuranSurahs[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Verses ${ConstantsData.ayaNumber[index]}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            ConstantsData.arabicAuranSuras[index],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
