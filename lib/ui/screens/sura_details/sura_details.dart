import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/models/sura_model.dart';
import 'package:quran/ui/utils/app_assets.dart';
import 'package:quran/ui/utils/app_colors.dart';
import 'package:quran/ui/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});
  static const String routeName = '/sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraContent = '';
  SuraModel? args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)?.settings.arguments as SuraModel;
    args = arguments;
    getSuraContent(args!.content);
  }

  Future<void> getSuraContent(String suraName) async {
    final String content =
        await rootBundle.loadString('assets/files/quran/$suraName');
    setState(() {
      suraContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
          ),
        ),
        title: Text(
          args!.enName,
          style: AppStyles.primaryBold20,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAssets.imConLeft,
                        width: 93,
                        height: 93,
                      ),
                      Text(
                        args!.arName,
                        style: AppStyles.primaryBold24,
                      ),
                      Image.asset(
                        AppAssets.imConRight,
                        width: 93,
                        height: 93,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: suraContent.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                            child: Text(
                              suraContent,
                              textAlign: TextAlign.center,
                              style: AppStyles.primaryBold20,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            AppAssets.imMosque,
            width: double.infinity,
            height: 112,
          ),
        ],
      ),
    );
  }
}
