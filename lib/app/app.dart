import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/logic/read_cubit/read_data_cubit.dart';
import 'package:note_app/features/home/logic/write_cubit/write_data_cubit.dart';

import '../core/router/router.dart';
import '../core/theme/app_themes.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReadDataCubit()),
        BlocProvider(create: (context) => WriteDataCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        darkTheme: AppThemes.dark,
        theme: AppThemes.light,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
