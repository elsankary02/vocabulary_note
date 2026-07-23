import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/home/ui/home/widget/alert_dialog_widget.dart';
import 'package:note_app/features/home/ui/home/widget/done_btn_widget.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/extensions/extension.dart';
import '../../home/widget/build_category_text_widget.dart';
import '../../home/widget/text_form_field_widget.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String lable;
  final VoidCallback? doneOnTap;
  final VoidCallback? languageOnTapIcon;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.lable,
    this.doneOnTap,
    this.languageOnTapIcon,
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

  int selectedLanguageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final s20 = const SizedBox(height: 20);
    final h20 = context.h * 0.02;

    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: h20, vertical: h20),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),

      title: TitleDialogWidget(title: widget.title),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: context.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildCategoryTextWidget(title: "selectLanguage".tr()),

              s20,
              TextFormFieldWidget(
                textController: textController,
                lable: widget.lable,
                validatorOne: '',
                validatorTwo: '',
              ),
            ],
          ),
        ),
      ),
      actions: [
        DoneBtnWidget(onTap: widget.doneOnTap, colorCode: AppColors.fillBlack),
      ],
    );
  }
}
