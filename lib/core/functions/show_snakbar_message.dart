import 'package:flutter/material.dart';
import 'package:note_app/core/utils/extensions/extension.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnakBarMessage(
  BuildContext context, {
  required String message,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError
          ? Colors.redAccent.shade700
          : Colors.teal.shade700,
      behavior: SnackBarBehavior.floating,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(context.h * 0.016),
      duration: const Duration(seconds: 3),
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
