import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/logic/write_cubit/write_data_cubit.dart';

class CategoryColorPickerWidget extends StatefulWidget {
  final int colorCode;
  const CategoryColorPickerWidget({super.key, required this.colorCode});

  @override
  State<CategoryColorPickerWidget> createState() =>
      _CategoryColorPickerWidgetState();
}

class _CategoryColorPickerWidgetState extends State<CategoryColorPickerWidget> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = Color(widget.colorCode);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => const SizedBox(width: 7),
        itemCount: _categoryColors.length,
        itemBuilder: (context, index) {
          final colorValue = _categoryColors[index];
          final color = Color(colorValue);
          final isSelected = _selectedColor == color;

          return CategoryColorItem(
            color: color,
            isSelected: isSelected,
            onTap: () {
              setState(() => _selectedColor = color);

              context.read<WriteDataCubit>().updateColorCode(
                colorCode: colorValue,
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryColorItem({
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 750),
          width: context.h * .044,
          height: context.h * .044,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? AppColors.white : Colors.transparent,
              width: 2,
            ),
          ),
          child: isSelected
              ? const Center(
                  child: Icon(Icons.check, color: AppColors.white, size: 24),
                )
              : null,
        ),
      ),
    );
  }
}

final List<int> _categoryColors = [
  0xFF4FB49C,
  0xFF5B8DEF,
  0xFF6C63D9,
  0xFF8B5CF6,
  0xFFEC6FA9,
  0xFFF08A5D,
  0xFFD4A017,
  0xFF6FAF8F,
  0xFF2CB1BC,
  0xFF2F9E73,
  0xFF4C6EF5,
  0xFFB76DDC,
  0xFF9C6644,
  0xFF577590,
  0xFF43AA8B,
  0xFFF28482,
  0xFF90BE6D,
  0xFF7B6CF6,
];
