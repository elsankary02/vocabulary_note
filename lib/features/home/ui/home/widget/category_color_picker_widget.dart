import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/logic/write_cubit/write_data_cubit.dart';

class CategoryColorPickerWidget extends StatefulWidget {
  final Color colorCode;
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
    _selectedColor = widget.colorCode;
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
          final color = _categoryColors[index];
          final isSelected = _selectedColor == color;

          return CategoryColorItem(
            color: color,
            isSelected: isSelected,
            onTap: () {
              setState(() => _selectedColor = color);

              context.read<WriteDataCubit>().updateColorCode(colorCode: color);
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

final List<Color> _categoryColors = [
  AppColors.note1,
  AppColors.note2,
  AppColors.note3,
  AppColors.note4,
  AppColors.note5,
  AppColors.note6,
  AppColors.note7,
  AppColors.note8,
  AppColors.note9,
  AppColors.note10,
  AppColors.note11,
  AppColors.note12,
  AppColors.note13,
  AppColors.note14,
  AppColors.note15,
  AppColors.note16,
  AppColors.note17,
  AppColors.note18,
];
