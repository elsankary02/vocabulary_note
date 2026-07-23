import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/home/ui/home/widget/build_title_and_filter_widget.dart';

import '../../../../../core/utils/extensions/extension.dart';
import '../widget/floating_action_button_widget.dart';
import '../widget/grid_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(),
      appBar: AppBar(title: Text('vocabularyNotes'.tr())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
        child: Column(
          children: [
            BuildTitleAndFilterWidget(),
            Expanded(child: GridViewWidget()),
          ],
        ),
      ),
    );
  }
}
