import 'package:flutter/material.dart';
import 'package:quran/constants_data.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_colors.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
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
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 30,
          indent: 46,
          endIndent: 46,
          color: AppColors.white,
        ),
        itemCount: 114,
      ),
    );
  }
}
