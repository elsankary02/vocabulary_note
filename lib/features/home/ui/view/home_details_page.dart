import 'package:flutter/material.dart';
import 'package:note_app/features/home/data/model/note_model.dart';

class HomeDetailsPage extends StatelessWidget {
  final NoteModel note;
  const HomeDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: note.color);
  }
}
