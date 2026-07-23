import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/extension.dart';

class ListTileWidget extends StatelessWidget {
  final bool? isBookIcon;
  final String? languageCode;
  final Widget? trailing;
  final VoidCallback? onPressed;
  const ListTileWidget({
    super.key,
    this.isBookIcon = true,
    this.trailing,
    this.onPressed,
    this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      leading: Container(
        alignment: .center,
        height: context.h * 0.050,
        width: context.h * 0.050,
        decoration: BoxDecoration(
          color: context.surface,
          shape: BoxShape.circle,
        ),
        child: isBookIcon == true
            ? Icon(Icons.menu_book_rounded)
            : Text(
                languageCode ?? "Ar",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
      title: Text(
        "Title",
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: context.onSurface,
        ),
      ),
      trailing:
          trailing ??
          (onPressed == null
              ? null
              : IconButton(
                  icon: Icon(Icons.delete, color: context.onSurface),
                  onPressed: onPressed,
                )),

      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // tileColor: note.color,
    );
  }
}
