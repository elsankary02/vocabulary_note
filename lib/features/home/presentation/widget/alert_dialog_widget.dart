import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/widget/category_language_widget.dart';

import '../../../../core/components/default_text_form_feild.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/extensions/extension.dart';
import 'category_color_widget.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  Color _selectedColor = _listColors[0];
  String _selectedLang = _listLanguages[0];

  @override
  Widget build(BuildContext context) {
    final s12 = const SizedBox(height: 12);
    final s20 = const SizedBox(height: 20);
    final h20 = context.h * 0.02;

    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: h20, vertical: h20),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: _selectedColor,
      title: _buildAlertTitle(context),
      content: SizedBox(
        width: context.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryText(context: context, title: "selectLanguage".tr()),
            s12,

            _buildCategoryLanguage(),
            s20,

            _buildCategoryText(context: context, title: "selectColor".tr()),
            s12,

            _buildCategoryColor(),
            s20,
            DefaultTextFormField(labelText: "enterWord".tr()),
          ],
        ),
      ),
    );
  }

  // Alert Title
  Text _buildAlertTitle(BuildContext context) {
    final surface = context.theme.colorScheme.surface;
    return Text(
      "addNewWord".tr(),
      textAlign: TextAlign.center,
      style: context.textTheme.headlineLarge?.copyWith(
        fontFamily: AppString.sofiaPro,
        fontWeight: FontWeight.w700,
        color: surface,
      ),
    );
  }

  // Category Text
  Widget _buildCategoryText({
    required BuildContext context,
    required String title,
  }) {
    final surface = context.theme.colorScheme.surface;
    return Text(
      title,
      style: context.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontFamily: AppString.sofiaPro,
        color: surface,
      ),
    );
  }

  // Category Color
  Widget _buildCategoryColor() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => const SizedBox(width: 7),
        itemCount: _listColors.length,
        itemBuilder: (context, index) {
          final color = _listColors[index];
          final isSelected = _selectedColor == color;
          return CategoryColorWidget(
            isSelected: isSelected,
            color: color,
            onTap: () {
              setState(() {
                _selectedColor = color;
              });
            },
          );
        },
      ),
    );
  }

  // Category Language
  Widget _buildCategoryLanguage() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemCount: _listLanguages.length,
        itemBuilder: (context, index) {
          final language = _listLanguages[index];
          final isSelectedLang = _selectedLang == language;
          return CategoryLanguageWidget(
            color: _selectedColor,
            language: language,
            isSelectedLang: isSelectedLang,
            onTap: () {
              setState(() {
                _selectedLang = language;
              });
            },
          );
        },
      ),
    );
  }
}

List<Color> _listColors = [
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
List<String> _listLanguages = ["En", "Ar"];
