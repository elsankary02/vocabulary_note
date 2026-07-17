import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';

import '../../../../../core/utils/extensions/extension.dart';

class CategoryColorWidget extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryColorWidget({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.h * .044,
          height: context.h * .044,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? AppColors.white : Colors.transparent,
              width: 3,
            ),
          ),
          child: isSelected
              ? Center(
                  child: Icon(Icons.check, color: AppColors.white, size: 24),
                )
              : null,
        ),
      ),
    );
  }
}
