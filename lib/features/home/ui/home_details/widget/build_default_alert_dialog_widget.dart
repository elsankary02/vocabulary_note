import 'package:flutter/material.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/data/model/note_model.dart';
import 'package:note_app/features/home/ui/home/widget/build_alert_title_widget.dart';
import 'package:note_app/features/home/ui/home/widget/build_done_btn_widget.dart';
import 'package:note_app/features/home/ui/home/widget/build_form_field_widget.dart';

class CustomAlertDialog extends StatefulWidget {
  final TestNoteModel note;
  final String title;
  final String lable;
  const CustomAlertDialog({
    super.key,
    required this.note,
    required this.title,
    required this.lable,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s20 = const SizedBox(height: 20);
    final h20 = context.h * 0.02;

    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: h20, vertical: h20),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: widget.note.color,
      title: BuildAlertTitleWidget(title: widget.title),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: context.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              s20,
              BuildFormFieldWidget(
                textController: textController,
                lable: widget.lable,
              ),
            ],
          ),
        ),
      ),
      actions: [
        // TODO: Refc This Local
        BuildDoneBtnWidget(
          formKey: _formKey,
          textController: textController,
          selectedColor: widget.note.color,
        ),
      ],
    );
  }
}
