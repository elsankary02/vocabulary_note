class WordModel {
  final int indexAtDatabase;
  final String text;
  final int colorCode;
  final bool isArebic;
  final List<String> arSimilarWords;
  final List<String> enSimilarWords;
  final List<String> arExamples;
  final List<String> enExamples;

  WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.colorCode,
    required this.isArebic,
    this.arSimilarWords = const [],
    this.enSimilarWords = const [],
    this.arExamples = const [],
    this.enExamples = const [],
  });
  //! Similar Word
  WordModel addSimilarWord(String similerWord, bool isArSimilerWord) {
    List<String> newSimilerWord = _intiNewSimilarword(isArSimilerWord);
    newSimilerWord.add(similerWord);
    return _getWordAfterCheckSimilarword(newSimilerWord, isArSimilerWord);
  }

  WordModel removeSimilarword(int indexAtSimilarWord, bool isArSimilerWord) {
    List<String> newSimilerWord = _intiNewSimilarword(isArSimilerWord);
    newSimilerWord.removeAt(indexAtSimilarWord);
    return _getWordAfterCheckSimilarword(newSimilerWord, isArSimilerWord);
  }

  //! Example
  WordModel addExample(String example, bool isArExample) {
    List<String> newExample = _intiNewExample(isArExample);
    newExample.add(example);
    return _getWordAfterCheckExample(isArExample, newExample);
  }

  WordModel removeExample(int indexAtExample, bool isArExample) {
    List<String> newExample = _intiNewExample(isArExample);
    newExample.removeAt(indexAtExample);
    return _getWordAfterCheckExample(isArExample, newExample);
  }

  //! Similar Word Funcs
  List<String> _intiNewSimilarword(bool isArSimilarWord) {
    if (isArSimilarWord) {
      return List.from(arSimilarWords);
    } else {
      return List.from(enSimilarWords);
    }
  }

  WordModel _getWordAfterCheckSimilarword(
    List<String> newSimilarWord,
    bool isArSimilarWord,
  ) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      colorCode: colorCode,
      isArebic: isArebic,
      arSimilarWords: isArSimilarWord ? newSimilarWord : arSimilarWords,
      enSimilarWords: !isArSimilarWord ? newSimilarWord : enSimilarWords,
      arExamples: arExamples,
      enExamples: enExamples,
    );
  }

  //! Example Funcs
  List<String> _intiNewExample(bool isArExamples) {
    if (isArExamples) {
      return List.from(arExamples);
    } else {
      return List.from(enExamples);
    }
  }

  WordModel _getWordAfterCheckExample(
    bool isArExample,
    List<String> newExample,
  ) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      colorCode: colorCode,
      isArebic: isArebic,
      arSimilarWords: arSimilarWords,
      enSimilarWords: enSimilarWords,
      arExamples: isArExample ? newExample : arExamples,
      enExamples: !isArExample ? newExample : enExamples,
    );
  }
}
