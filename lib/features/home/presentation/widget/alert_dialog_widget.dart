import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/components/default_text_form_feild.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/presentation/widget/color_picker_item.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  Color selectedColor = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: selectedColor,
      title: Text(
        "addNewWord".tr(),
        textAlign: TextAlign.center,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      content: SizedBox(
        width: context.w,
        child: Column(
          mainAxisSize: MainAxisSize.min, // تم تصحيح .min هنا لتعمل بشكل صحيح
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context: context, title: "selectLanguage".tr()),
            const SizedBox(height: 16),

            _buildTitle(context: context, title: "selectColor".tr()),
            const SizedBox(height: 12),

            _buildColorPickerList(),
            const SizedBox(height: 12),
            DefaultTextFormField(labelText: "test".tr()),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPickerList() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final listColors = colors[index];
          final isSelected = selectedColor == listColors;

          return ColorPickerItem(
            color: listColors,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                selectedColor = listColors;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildTitle({required BuildContext context, required String title}) {
    return Text(
      title,
      style: context.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

List<Color> colors = [
  AppColors.primary,
  AppColors.grey,
  AppColors.red,
  AppColors.note1,
  AppColors.note2,
  AppColors.note3,
  AppColors.note4,
];
