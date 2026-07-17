import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/features/home/data/model/note_model.dart';
import 'package:note_app/features/home/logic/test_note_cubit/test_note_cubit.dart';
import 'package:note_app/features/home/ui/widget/alert_dialog_widget.dart';

class BuildFloatingActionButtonWidget extends StatelessWidget {
  const BuildFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final note = await showDialog<NoteModel>(
          context: context,

          builder: (context) => AlertDialogWidget(),
        );
        log("Note : $note");
        if (!context.mounted) return;
        if (note != null) {
          context.read<TestNoteCubit>().add(note);
        }
      },
      shape: const CircleBorder(),
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, color: AppColors.white, size: 24),
    );
  }
}
