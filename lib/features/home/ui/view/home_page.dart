import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/features/home/data/model/note_model.dart';
import 'package:note_app/features/home/logic/test_note_cubit/test_note_cubit.dart';

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
    return BlocProvider(
      create: (context) => TestNoteCubit(),
      child: BlocBuilder<TestNoteCubit, TestNoteState>(
        builder: (context, state) => Scaffold(
          floatingActionButton: _buildFloatingActionBtn(context: context),
          appBar: _buildSliverAppBar(context: context),
          body: SafeArea(top: false, child: SliverGridViewWidget()),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionBtn({
    required BuildContext context,
  }) {
    return FloatingActionButton(
      onPressed: () async {
        final note = await showDialog<NoteModel>(
          context: context,

          builder: (context) => AlertDialogWidget(),
        );
        log("Note : $note");
        if (!context.mounted) return;
        if (note != null) {
          context.read<TestNoteCubit>().add(note);
        }
      },
      shape: const CircleBorder(),
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, color: AppColors.white, size: 24),
    );
  }

  AppBar _buildSliverAppBar({required BuildContext context}) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      title: Text(
        'vocabularyNotes'.tr(),
        style: context.textTheme.titleMedium?.copyWith(
          fontFamily: AppString.pacifico,
        ),
      ),
      actionsPadding: EdgeInsetsDirectional.only(end: context.h * 0.02),
      actions: [_buildFilterAction(context)],
    );
  }

  SizedBox _buildFilterAction(BuildContext context) {
    return SizedBox(
      height: context.h * 0.050,
      width: context.h * 0.050,
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          AppSvg.filter,
          colorFilter: ColorFilter.mode(context.onSurface, BlendMode.srcIn),
        ),
      ),
    );
  }
}
