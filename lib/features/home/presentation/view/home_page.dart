import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/constants/app_svg.dart';
import '../../../../core/utils/extensions/extension.dart';
import '../widget/alert_dialog_widget.dart';
import '../widget/sliver_grid_view_widget.dart';

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
      actionsPadding: EdgeInsetsDirectional.only(end: context.h * 0.02),
      actions: [_action(context)],
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

  SizedBox _action(BuildContext context) {
    return SizedBox(
      height: context.h * 0.050,
      width: context.h * 0.050,
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          AppSvg.filter,
          colorFilter: ColorFilter.mode(
            context.theme.colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
