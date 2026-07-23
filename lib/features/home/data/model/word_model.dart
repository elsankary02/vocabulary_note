class WordModel {
  final int indexAtDatabase;
  final String text;
  final int colorCode;
  final bool isArabic;
  final List<String> arSimilarWords;
  final List<String> enSimilarWords;
  final List<String> arExamples;
  final List<String> enExamples;

  const WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.colorCode,
    required this.isArabic,
    this.arSimilarWords = const [],
    this.enSimilarWords = const [],
    this.arExamples = const [],
    this.enExamples = const [],
  });
  WordModel copyWith({
    int? indexAtDatabase,
    String? text,
    int? colorCode,
    bool? isArabic,
    List<String>? arSimilarWords,
    List<String>? enSimilarWords,
    List<String>? arExamples,
    List<String>? enExamples,
  }) {
    return WordModel(
      indexAtDatabase: indexAtDatabase ?? this.indexAtDatabase,
      text: text ?? this.text,
      colorCode: colorCode ?? this.colorCode,
      isArabic: isArabic ?? this.isArabic,
      arSimilarWords: arSimilarWords ?? this.arSimilarWords,
      enSimilarWords: enSimilarWords ?? this.enSimilarWords,
      arExamples: arExamples ?? this.arExamples,
      enExamples: enExamples ?? this.enExamples,
    );
  }

  //! index At Database
  WordModel decrementIndexAtDatabase() {
    return copyWith(indexAtDatabase: indexAtDatabase - 1);
  }

  //! Similar
  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
    final newSimilarWord = _copyNewSimilarWord(isArabicSimilarWord)
      ..add(similarWord);

    return copyWith(
      arSimilarWords: isArabicSimilarWord ? newSimilarWord : arSimilarWords,
      enSimilarWords: !isArabicSimilarWord ? newSimilarWord : enSimilarWords,
    );
  }

  WordModel removeSimilarWord(
    int indexAtSimilarWord,
    bool isArabicSimilarWord,
  ) {
    final newSimilarWord = _copyNewSimilarWord(isArabicSimilarWord)
      ..removeAt(indexAtSimilarWord);

    return copyWith(
      arSimilarWords: isArabicSimilarWord ? newSimilarWord : arSimilarWords,
      enSimilarWords: !isArabicSimilarWord ? newSimilarWord : enSimilarWords,
    );
  }

  //! Example
  WordModel addExample(String example, bool isArExample) {
    final newExample = _copyNewExample(isArExample)..add(example);

    return copyWith(
      arExamples: isArExample ? newExample : arExamples,
      enExamples: !isArExample ? newExample : enExamples,
    );
  }

  WordModel removeExample(int indexAtExample, bool isArExample) {
    final newExample = _copyNewExample(isArExample)..removeAt(indexAtExample);

    return copyWith(
      arExamples: isArExample ? newExample : arExamples,
      enExamples: !isArExample ? newExample : enExamples,
    );
  }

  //! Copy New Similar word
  List<String> _copyNewSimilarWord(bool isArabicSimilarWord) =>
      List<String>.from(isArabicSimilarWord ? arSimilarWords : enSimilarWords);

  //! Copy New Example
  List<String> _copyNewExample(bool isArExamples) =>
      List<String>.from(isArExamples ? arExamples : enExamples);
}
