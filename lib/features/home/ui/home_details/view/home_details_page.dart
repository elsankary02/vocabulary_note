import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/utils/extensions/extension.dart';
import 'package:note_app/features/home/data/model/note_model.dart';
import 'package:note_app/features/home/ui/home_details/widget/build_action_button_widget.dart';
import 'package:note_app/features/home/ui/home_details/widget/build_default_alert_dialog_widget.dart';
import 'package:note_app/features/home/ui/home_details/widget/build_list_tile_widget.dart';

class HomeDetailsPage extends StatelessWidget {
  final TestNoteModel note;
  const HomeDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.headlineSmall?.copyWith(
      color: note.color,
      fontWeight: FontWeight.w900,
    );
    return Scaffold(
      appBar: _buildAppBarFunc(context: context, style: style),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.h * 0.02,
          vertical: context.h * 0.02,
        ),
        children: [
          Text("word".tr(), style: style),
          SizedBox(height: context.h * .015),

          BuildListTileWidget(note: note),
          SizedBox(height: context.h * .05),

          BuildActionButtonWidget(
            title: "similarWords".tr(),
            style: style,
            note: note,
            onTap: () => showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                note: note,
                title: "add_similar".tr(),
                lable: "new_similar_word".tr(),
              ),
            ),
          ),
          SizedBox(height: context.h * .05),

          BuildActionButtonWidget(
            title: "examples".tr(),
            style: style,
            note: note,
            onTap: () => showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                note: note,
                title: "add_example".tr(),
                lable: "new_example".tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBarFunc({required BuildContext context, TextStyle? style}) {
    return AppBar(
      title: Text("wordDetails".tr(), style: style),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back_ios_new_outlined, color: note.color),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            //TODO: Delete
          },
          icon: Icon(Icons.delete, color: note.color),
        ),
      ],
    );
  }
}
