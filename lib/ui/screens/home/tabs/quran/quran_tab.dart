import 'package:flutter/material.dart';
import 'package:quran/ui/screens/home/tabs/quran/widgets/sura_details_item.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_colors.dart';
import 'package:quran/ui/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.background,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.logo,
                height: 126,
                width: 300,
              ),
              SizedBox(
                height: 20,
              ),
              buildTextField(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Suras List',
                style: AppStyles.whiteBold16,
              ),
              SizedBox(
                height: 10,
              ),
              buildSuraItem(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSuraItem() {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SuraDetailsItem(index: index,);
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

  Widget buildTextField() {
    return TextField(
      cursorColor: AppColors.white,
      cursorWidth: 2,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.blackWithOpacity,
        filled: true,
        border: outBorder(),
        enabledBorder: outBorder(),
        focusedBorder: outBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(
            AppAssets.icQuran,
            width: 28,
            height: 28,
            color: AppColors.primary,
          ),
        ),
        hintText: 'Sura Name',
        hintStyle: TextStyle(
            fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w700),
      ),
    );
  }

  OutlineInputBorder outBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    );
  }
}
