import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: App());
  }
}

class App extends StatelessWidget {
  App({super.key});

  late Box box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  box = await Hive.openBox("hello");
                  log("Box Opened");
                },
                child: Text('Open Box'),
              ),

              ElevatedButton(onPressed: () {}, child: Text('Put At')),

              ElevatedButton(onPressed: () {}, child: Text('Display Data')),
            ],
          ),
        ),
      ),
    );
  }
}
