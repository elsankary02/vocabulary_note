import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/theme/app_colors.dart';

import '../../../../core/utils/constants/app_string.dart';
import '../../data/model/word_model.dart';

part 'write_data_state.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  WriteDataCubit() : super(WriteDataInitial());

  final Box box = Hive.box(AppString.wordsBox);
  String text = "";
  bool isArabic = true;
  Color colorCode = AppColors.note1;

  void updateText({required String text}) {
    this.text = text;
    emit(WriteDataSuccess());
  }

  void updateIsArabic({required bool isArabic}) {
    this.isArabic = isArabic;
    emit(WriteDataSuccess());
  }

  void updateColorCode({required Color colorCode}) {
    this.colorCode = colorCode;
    emit(WriteDataSuccess());
  }

  void addSimilarWord(int indexAtDatabase) {
    _tryCatch(
      callMethod: () {
        List<WordModel> words = _getWordsFromDataBase();

        words[indexAtDatabase] = words[indexAtDatabase].addSimilarWord(
          text,
          isArabic,
        );
        _boxputData(words);
      },
      errMesssage: "We have problem when we Add Similar Word, please try again",
    );
  }

  void deleteSimilarWord(
    int indexAtDatabase,
    int indexAtSimilarWord,
    bool isArabicSimilarWord,
  ) {
    _tryCatch(
      callMethod: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].removeSimilarWord(
          indexAtSimilarWord,
          isArabicSimilarWord,
        );
        _boxputData(words);
      },
      errMesssage:
          "We have problem when we Delete Similar Word, please try again",
    );
  }

  void addExample(int indexAtDatabase) {
    _tryCatch(
      callMethod: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].addExample(
          text,
          isArabic,
        );
        _boxputData(words);
      },
      errMesssage: "We have problem when we Add Example, please try again",
    );
  }

  void deleteExample(
    int indexAtDatabase,
    int indexAtExample,
    bool isArExample,
  ) {
    _tryCatch(
      callMethod: () {
        List<WordModel> words = _getWordsFromDataBase();
        words[indexAtDatabase] = words[indexAtDatabase].removeExample(
          indexAtExample,
          isArExample,
        );
        _boxputData(words);
      },
      errMesssage: "We have problem when we Delete Example, please try again",
    );
  }

  void addWord() {
    _tryCatch(
      callMethod: () {
        List<WordModel> words = _getWordsFromDataBase();
        words.add(
          WordModel(
            indexAtDatabase: words.length,
            text: text,
            colorCode: colorCode,
            isArabic: isArabic,
          ),
        );
        _boxputData(words);
      },
      errMesssage: "We have problem when we Add word, please try again",
    );
    emit(WriteDataLoading());
  }

  void deleteWord(int indexAtDatabase) {
    _tryCatch(
      callMethod: () {
        List<WordModel> words = _getWordsFromDataBase();
        words.removeAt(indexAtDatabase);
        for (var i = indexAtDatabase; i < words.length; i++) {
          words[i] = words[i].decrementIndexAtDatabase();
        }
        _boxputData(words);
      },
      errMesssage: "We have problem when we Delete word, please try again",
    );
  }

  void _tryCatch({
    required VoidCallback callMethod,
    required String errMesssage,
  }) {
    emit(WriteDataLoading());
    try {
      callMethod.call();
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailuer(errMesssage: errMesssage));
    }
  }

  void _boxputData(List<WordModel> words) =>
      box.put(AppString.wordsList, words);

  List<WordModel> _getWordsFromDataBase() => List.from(
    box.get(AppString.wordsList, defaultValue: []),
  ).cast<WordModel>();
}
