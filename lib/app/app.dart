import 'package:flutter/material.dart';
import 'package:note_app/core/router/router.dart';
import 'package:note_app/core/theme/app_themes.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.dark,
      theme: AppThemes.light,
      themeMode: ThemeMode.light,
    );
  }
}
