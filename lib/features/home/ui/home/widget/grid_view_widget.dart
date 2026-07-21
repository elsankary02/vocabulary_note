import 'package:flutter/material.dart';

import '../../../../../core/components/custom_words_btn.dart';
import '../../../../../core/utils/extensions/extension.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: context.h * 0.02,
        vertical: context.h * 0.02,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: context.h * 0.014,
        mainAxisSpacing: context.h * 0.020,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return CustomWordsBtn();
      },
    );
  }
}
