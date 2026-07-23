import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/default_primary_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/extensions/extension.dart';

class DoneBtnWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color colorCode;
  const DoneBtnWidget({
    super.key,
    required this.colorCode,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultPrimaryBtn(
      backgroundColor: AppColors.white,
      title: "Done".tr(),
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: colorCode,
      ),
      onTap: onTap,
    );
  }
}
