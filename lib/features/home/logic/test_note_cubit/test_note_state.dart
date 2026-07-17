part of 'test_note_cubit.dart';

abstract class TestNoteState {}

final class TestNoteInitial extends TestNoteState {}

final class TestNoteAdd extends TestNoteState {
  final List<NoteModel> noteList;

  TestNoteAdd({required this.noteList});
}
