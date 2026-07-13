import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/router/router.dart';
import '../../core/router/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/constants/app_images.dart';
import '../../core/utils/extensions/extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _navigateDelayed();
    super.initState();
  }

  void _navigateDelayed() async {
    await Future.delayed(const Duration(seconds: 3), () {
      router.replaceNamed(Routes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: Text(
                "emptyWordsMessage".tr(),
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            Image.asset(AppImages.splashLogo, height: 270, width: 300),
          ],
        ),
      ),
    );
  }
}
