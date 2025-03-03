import 'package:flutter/material.dart';
import 'package:quran/models/sura_details_model.dart';
import 'package:quran/models/sura_model.dart';
import 'package:quran/ui/screens/sura_details/sura_details.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_styles.dart';

class SuraDetailsItem extends StatelessWidget {
  const SuraDetailsItem({
    super.key,
    required this.index, required this.sura,
  });

  final SuraModel sura;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        SuraDetails.routeName,
        arguments: SuraContentModel(
          arName: sura.nameAr,
          enName: sura.nameEn,
          content: sura.content,
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
                style: AppStyles.whiteBold16,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: AppStyles.whiteBold16.copyWith(fontSize: 20),
                ),
                Text(
                  'Verses ${sura.verses}',
                  style: AppStyles.whiteBold16.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            sura.nameAr,
            style: AppStyles.whiteBold16.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
