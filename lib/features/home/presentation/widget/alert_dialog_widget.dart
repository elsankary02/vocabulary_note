import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/default_text_form_feild.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/extensions/extension.dart';
import 'color_picker_item.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  Color selectedColor = AppColors.note1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: selectedColor,
      title: Text(
        "addNewWord".tr(),
        textAlign: TextAlign.center,
        style: context.textTheme.headlineSmall?.copyWith(
          fontFamily: AppString.sofiaPro,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
      content: SizedBox(
        width: context.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context: context, title: "selectLanguage".tr()),
            const SizedBox(height: 16),
            _buildLanguage(),

            _buildTitle(context: context, title: "selectColor".tr()),
            const SizedBox(height: 12),
            _buildColorPickerList(),

            const SizedBox(height: 12),
            DefaultTextFormField(labelText: "enterWord".tr()),
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
          final isSelected = selectedColor == colors[index];
          return ColorPickerItem(
            isSelected: isSelected,
            color: colors[index],
            onTap: () {
              setState(() {
                selectedColor = colors[index];
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
        fontFamily: AppString.sofiaPro,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildLanguage() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

List<Color> colors = [
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
