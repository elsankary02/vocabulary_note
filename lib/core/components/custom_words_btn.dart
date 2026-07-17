import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/extensions/extension.dart';

class CustomWordsBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final Color? color;
  const CustomWordsBtn({super.key, this.onTap, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.note1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title ?? "Test".tr(),
            maxLines: 4,
            overflow: .ellipsis,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
