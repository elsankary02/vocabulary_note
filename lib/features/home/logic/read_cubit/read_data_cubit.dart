import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/enums/language_filter.dart';
import 'package:note_app/core/enums/sortedby.dart';
import 'package:note_app/core/enums/sorting_type.dart';
import 'package:note_app/core/utils/constants/app_string.dart';
import 'package:note_app/features/home/data/model/word_model.dart';

part 'read_data_state.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit() : super(ReadDataInitial());
  final _box = Hive.box(AppString.wordsBox);
  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.descending;

  void updateLanguageFilter(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
  }

  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
  }

  void updateSortingType(SortingType sortingType) {
    this.sortingType = sortingType;
  }

  void getWords() {
    emit(ReadDataLoading());
    try {
      List<WordModel> wordsToReturn = List.from(
        _box.get(AppString.wordsList, defaultValue: []),
      ).cast<WordModel>();
      _removeUnWantedWords(wordsToReturn);
      _applySorting(wordsToReturn);
      emit(ReadDataSuccess(words: wordsToReturn));
    } catch (e) {
      emit(
        ReadDataFailuer(
          errMesssage: "We have problem at get data ${e.toString()}",
        ),
      );
    }
    {
      emit(ReadDataFailuer(errMesssage: e.toString()));
    }
  }

  void _removeUnWantedWords(List<WordModel> wordsToReturn) {
    if (languageFilter == LanguageFilter.allWords) return;

    for (var i = 0; i < wordsToReturn.length; i++) {
      if ((languageFilter == LanguageFilter.arabicOnly &&
              wordsToReturn[i].isArabic == false) ||
          (languageFilter == LanguageFilter.englishOnly &&
              wordsToReturn[i].isArabic == true)) {
        wordsToReturn.removeAt(i);
        i--;
      }
    }
  }

  void _applySorting(List<WordModel> wordsReturn) {
    if (sortedBy == SortedBy.time) {
      if (sortingType == SortingType.ascending) {
        return;
      } else {
        _reverse(wordsReturn);
      }
    } else {
      wordsReturn.sort(
        (WordModel a, WordModel b) => a.text.length.compareTo(b.text.length),
      );
      if (sortingType == SortingType.ascending) {
        return;
      } else {
        _reverse(wordsReturn);
      }
    }
  }

  void _reverse(List<WordModel> wordsReturn) {
    for (var i = 0; i < wordsReturn.length / 2; i++) {
      final temp = wordsReturn[i];
      wordsReturn[i] = wordsReturn[wordsReturn.length - 1 - i];
      wordsReturn[wordsReturn.length - 1 - i] = temp;
    }
  }
}
