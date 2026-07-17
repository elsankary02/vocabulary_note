import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/features/home/logic/test_note_cubit/test_note_cubit.dart';

import '../../../../core/components/custom_words_btn.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/extensions/extension.dart';

class SliverGridViewWidget extends StatelessWidget {
  const SliverGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestNoteCubit, TestNoteState>(
      listener: (context, state) {
        if (state is TestNoteAdd) {
          log("${state.noteList}");
        }
      },
      builder: (context, state) {
        if (state is TestNoteAdd) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: context.h * 0.032,
              vertical: context.h * 0.02,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: context.h * 0.014,
              mainAxisSpacing: context.h * 0.020,
            ),
            itemCount: state.noteList.length,
            itemBuilder: (context, index) {
              final note = state.noteList[index];

              return CustomWordsBtn(
                title: note.title,
                color: note.color,
                onTap: () =>
                    context.pushNamed(Routes.homeDetailsPage, extra: note),
              );
            },
          );
        } else {
          return Center(child: Text("List Empty"));
        }
      },
    );
  }
}
