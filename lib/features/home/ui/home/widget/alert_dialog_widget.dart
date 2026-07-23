import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/functions/show_snakbar_message.dart';
import 'package:note_app/core/utils/constants/app_string.dart';
import 'package:note_app/features/home/logic/read_cubit/read_data_cubit.dart';
import 'package:note_app/features/home/logic/write_cubit/write_data_cubit.dart';
import 'package:note_app/features/home/ui/home/widget/done_btn_widget.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/extensions/extension.dart';
import 'build_category_text_widget.dart';
import 'category_color_picker_widget.dart';
import 'text_form_field_widget.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
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

    return BlocConsumer<WriteDataCubit, WriteDataState>(
      listener: (context, state) {
        if (state is WriteDataFailuer) {
          showSnakBarMessage(
            isError: true,
            message: state.errMesssage,
            context,
          );
          return;
        }
      },
      builder: (context, state) {
        final colorCode = context.read<WriteDataCubit>().colorCode;
        return AlertDialog(
          backgroundColor: Color(colorCode),
          contentPadding: EdgeInsets.symmetric(horizontal: h20, vertical: h20),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: TitleDialogWidget(title: "addNewWord".tr()),
          content: Form(
            key: _formKey,
            child: SizedBox(
              width: context.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  s20,
                  BuildCategoryTextWidget(title: "selectColor".tr()),
                  s12,
                  CategoryColorPickerWidget(colorCode: colorCode),
                  s20,
                  TextFormFieldWidget(
                    textController: textController,
                    lable: "enterWord".tr(),
                    validatorOne: "wordRequired".tr(),
                    validatorTwo: "wordTooShort".tr(),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            DoneBtnWidget(
              onTap: () {
                if (!_formKey.currentState!.validate()) return;
                context.read<WriteDataCubit>().addWord();
                context.read<ReadDataCubit>().getWords();
                context.pop();
              },
              colorCode: Color(colorCode),
            ),
          ],
        );
      },
    );
  }
}

class TitleDialogWidget extends StatelessWidget {
  final String title;
  const TitleDialogWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.headlineLarge?.copyWith(
        fontFamily: AppString.sofiaPro,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}
