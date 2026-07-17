import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/features/home/data/model/note_model.dart';

class BuildActionButtonWidget extends StatelessWidget {
  final TestNoteModel note;
  final TextStyle? style;
  final String title;
  final VoidCallback? onTap;

  const BuildActionButtonWidget({
    super.key,
    required this.onTap,
    required this.note,
    this.style,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title, style: style),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: note.color,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Icon(Icons.add, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
