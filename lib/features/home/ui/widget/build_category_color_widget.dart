import 'package:flutter/material.dart';
import 'package:note_app/features/home/ui/widget/category_color_widget.dart';

class BuildCategoryColorWidget extends StatelessWidget {
  final ValueChanged<Color> onTap;
  final Color selectedColor;
  final List<Color> listColors;
  const BuildCategoryColorWidget({
    super.key,
    required this.selectedColor,
    required this.onTap,
    required this.listColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => const SizedBox(width: 7),
        itemCount: listColors.length,
        itemBuilder: (context, index) {
          final color = listColors[index];
          final isSelected = selectedColor == color;
          return CategoryColorWidget(
            isSelected: isSelected,
            color: color,
            onTap: () => onTap(color),
          );
        },
      ),
    );
  }
}
