import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/app.dart';
import 'core/utils/constants/app_string.dart';
import 'features/home/data/model/word_type_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox(AppString.wordsBox);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: AppString.translationsPath,
      fallbackLocale: const Locale('en'),
      child: NoteApp(),
    ),
  );
}
