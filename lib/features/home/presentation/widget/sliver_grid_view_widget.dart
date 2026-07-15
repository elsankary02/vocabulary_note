import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/components/custom_words_btn.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/extensions/extension.dart';

class SliverGridViewWidget extends StatelessWidget {
  const SliverGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: context.h * 0.032,
        vertical: context.h * 0.02,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.h * 0.014,
          mainAxisSpacing: context.h * 0.020,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 20,
          (context, index) => CustomWordsBtn(
            onTap: () => context.pushNamed(Routes.homeDetailsPage),
          ),
        ),
      ),
    );
  }
}
