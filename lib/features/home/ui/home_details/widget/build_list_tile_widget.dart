import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/data/model/note_model.dart';

class BuildListTileWidget extends StatelessWidget {
  final TestNoteModel note;

  const BuildListTileWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      leading: Container(
        height: context.h * 0.050,
        width: context.h * 0.050,
        decoration: BoxDecoration(
          color: context.surface,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.menu_book_rounded, color: note.color),
      ),
      title: Text(
        note.title,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: note.color,
    );
  }
}
