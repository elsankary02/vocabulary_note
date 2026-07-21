import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import 'alert_dialog_widget.dart';

class BuildFloatingActionButtonWidget extends StatelessWidget {
  const BuildFloatingActionButtonWidget({super.key});

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
