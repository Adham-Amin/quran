import 'package:flutter/material.dart';
import 'package:quran/ui/utils/app_colors.dart';

abstract final class AppStyles {
  static const TextStyle primaryBold20 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppColors.primary,
  );
  static const TextStyle primaryBold24 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: AppColors.primary,
  );
  static const TextStyle whiteBold16 = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );
}
