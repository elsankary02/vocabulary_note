import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/enums/sortedby.dart';
import '../../../../core/enums/sorting_type.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../data/model/word_model.dart';

part 'read_data_state.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit() : super(ReadDataInitial());
  final box = Hive.box(AppString.wordsBox);

  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.descending;

  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
  }

  void updateSortingType(SortingType sortingType) {
    this.sortingType = sortingType;
  }

  void getWords() {
    emit(ReadDataLoading());
    try {
      List<WordModel> wordsToReturn = _getWordsFromDataBase();
      _applySorting(wordsToReturn);
      emit(ReadDataSuccess(words: wordsToReturn));
    } catch (e) {
      emit(
        ReadDataFailuer(
          errMesssage: "We have problem when we Get word, please try again",
        ),
      );
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

  List<WordModel> _getWordsFromDataBase() => List.from(
    box.get(AppString.wordsList, defaultValue: []),
  ).cast<WordModel>();
}
