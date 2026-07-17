import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/constants/app_string.dart';
import 'package:note_app/core/utils/extensions/extension.dart';

class BuildAlertTitleWidget extends StatelessWidget {
  final String title;
  const BuildAlertTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.headlineLarge?.copyWith(
        fontFamily: AppString.sofiaPro,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}
