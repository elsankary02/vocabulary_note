import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/components/default_primary_btn.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/data/model/note_model.dart';

class BuildDoneBtnWidget extends StatelessWidget {
  const BuildDoneBtnWidget({
    super.key,
    required this.textController,
    required this._selectedColor,
    required this.formKey,
  });

  final TextEditingController textController;
  final GlobalKey<FormState> formKey;
  final Color _selectedColor;
  @override
  Widget build(BuildContext context) {
    return DefaultPrimaryBtn(
      backgroundColor: AppColors.white,
      title: "Done".tr(),
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: _selectedColor,
      ),
      onTap: () {
        if (!formKey.currentState!.validate()) return;
        context.pop<TestNoteModel>(
          TestNoteModel(
            title: textController.text.trim(),
            color: _selectedColor,
          ),
        );
      },
    );
  }
}
