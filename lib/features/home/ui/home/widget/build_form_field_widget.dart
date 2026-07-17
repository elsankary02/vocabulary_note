import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/components/default_text_form_feild.dart';

class BuildFormFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String lable;
  const BuildFormFieldWidget({
    super.key,
    required this.textController,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      labelText: lable,
      controller: textController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "wordRequired".tr();
        }

        if (value.trim().length < 2) {
          return "wordTooShort".tr();
        }

        return null;
      },
    );
  }
}
