import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await Hive.openBox("myBox");
              },
              child: Text('Open Box'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Put')),
            ElevatedButton(onPressed: () {}, child: Text('Put All')),
            ElevatedButton(onPressed: () {}, child: Text('Put At')),
          ],
        ),
      ),
    );
  }
}
