import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/theme/app_colors.dart';
import 'package:note_app/core/utils/constants/app_string.dart';
import 'package:note_app/core/utils/constants/app_svg.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/presentation/widget/alert_dialog_widget.dart';
import 'package:note_app/features/home/presentation/widget/sliver_grid_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionBtn(context: context),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            _sliverAppBar(context: context),
            SliverGridViewWidget(),
          ],
        ),
      ),
    );
  }

  Widget _sliverAppBar({required BuildContext context}) {
    return SliverAppBar(
      floating: true,
      snap: true,
      surfaceTintColor: Colors.transparent,

      title: Text(
        'vocabularyNotes'.tr(),
        style: context.textTheme.titleMedium?.copyWith(
          fontFamily: AppString.pacifico,
        ),
      ),
      actions: [
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsetsDirectional.only(end: 10),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppSvg.filter),
          ),
        ),
      ],
    );
  }

  FloatingActionButton _floatingActionBtn({required BuildContext context}) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(),
      ),
      shape: const CircleBorder(),
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add),
    );
  }
}
