import 'package:flutter/material.dart';
import 'package:note_app/core/utils/constants/app_string.dart';
import 'package:note_app/core/utils/extensions/extension.dart';

class CategoryLanguageWidget extends StatelessWidget {
  final String language;
  final bool isSelectedLang;
  final VoidCallback? onTap;
  final Color color;
  const CategoryLanguageWidget({
    super.key,
    required this.language,
    required this.isSelectedLang,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final surface = context.theme.colorScheme.surface;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.h * 0.050,
        height: context.h * 0.050,
        decoration: BoxDecoration(
          color: isSelectedLang ? color : surface,
          shape: BoxShape.circle,
          border: Border.all(color: surface, width: 3),
        ),
        child: Center(
          child: Text(
            language,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: AppString.sofiaPro,
              color: isSelectedLang ? surface : color,
            ),
          ),
        ),
      ),
    );
  }
}
