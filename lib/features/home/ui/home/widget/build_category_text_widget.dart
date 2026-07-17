import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/extensions/extension.dart';

class BuildCategoryTextWidget extends StatelessWidget {
  final String title;
  const BuildCategoryTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}
