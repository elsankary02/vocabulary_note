import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/home/ui/home/widget/build_alert_title_widget.dart';
import 'package:note_app/features/home/ui/home/widget/build_category_color_widget.dart';
import 'package:note_app/features/home/ui/home/widget/build_category_text_widget.dart';
import 'package:note_app/features/home/ui/home/widget/build_done_btn_widget.dart';
import 'package:note_app/features/home/ui/home/widget/build_form_field_widget.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/extensions/extension.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  Color _selectedColor = _listColors[0];
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s12 = const SizedBox(height: 12);
    final s20 = const SizedBox(height: 20);
    final h20 = context.h * 0.02;

    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: h20, vertical: h20),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: _selectedColor,
      title: BuildAlertTitleWidget(title: "addNewWord".tr()),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: context.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildCategoryTextWidget(title: "selectColor".tr()),
              s12,
              BuildCategoryColorWidget(
                listColors: _listColors,
                selectedColor: _selectedColor,
                onTap: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
              s20,
              BuildFormFieldWidget(
                textController: textController,
                lable: "enterWord".tr(),
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
          selectedColor: _selectedColor,
        ),
      ],
    );
  }
}

final List<Color> _listColors = [
  AppColors.note1,
  AppColors.note2,
  AppColors.note3,
  AppColors.note4,
  AppColors.note5,
  AppColors.note6,
  AppColors.note7,
  AppColors.note8,
  AppColors.note9,
  AppColors.note10,
  AppColors.note11,
  AppColors.note12,
];
