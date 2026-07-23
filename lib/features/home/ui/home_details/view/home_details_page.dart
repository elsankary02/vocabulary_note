import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/extensions/extension.dart';
import '../widget/action_button_widget.dart';
import '../widget/custom_alert_dialog_widget.dart';
import '../widget/list_tile_widget.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({super.key});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w900,
    );
    return Scaffold(
      appBar: _buildAppBarFunc(context: context),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.h * 0.02,
          vertical: context.h * 0.02,
        ),
        children: [
          Text("word".tr(), style: style),
          SizedBox(height: context.h * .015),

          ListTileWidget(),
          SizedBox(height: context.h * .05),

          ActionButtonWidget(
            title: "similarWords".tr(),
            style: style,

            onTap: () => showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: "add_similar".tr(),
                lable: "new_similar_word".tr(),
                doneOnTap: () {},
              ),
            ),
          ),
          SizedBox(height: context.h * .015),
          SizedBox(height: context.h * .05),

          ActionButtonWidget(
            title: "examples".tr(),
            style: style,

            onTap: () => showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: "add_example".tr(),
                lable: "new_example".tr(),
                doneOnTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBarFunc({required BuildContext context}) {
    return AppBar(
      title: Text("wordDetails".tr()),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),

      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.delete))],
    );
  }
}
