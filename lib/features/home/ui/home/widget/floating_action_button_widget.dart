import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/features/home/ui/home/widget/alert_dialog_widget.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(),
      ),
      shape: const CircleBorder(),
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, color: AppColors.white, size: 24),
    );
  }
}
