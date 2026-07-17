import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/utils/constants/app_string.dart';
import 'package:note_app/core/utils/extensions/extension.dart';

class BuildAlertTitleWidget extends StatelessWidget {
  const BuildAlertTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "addNewWord".tr(),
      textAlign: TextAlign.center,
      style: context.textTheme.headlineLarge?.copyWith(
        fontFamily: AppString.sofiaPro,
        fontWeight: FontWeight.w700,
        color: context.onSurface,
      ),
    );
  }
}
