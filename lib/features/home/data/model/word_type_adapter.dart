import 'package:hive_flutter/adapters.dart';
import 'package:note_app/features/home/data/model/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      indexAtDatabase: reader.readInt(),
      text: reader.readString(),
      colorCode: reader.readInt(),
      isArebic: reader.readBool(),
      arSimilarWords: reader.readStringList(),
      enSimilarWords: reader.readStringList(),
      arExamples: reader.readStringList(),
      enExamples: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeInt(obj.indexAtDatabase);
    writer.writeString(obj.text);
    writer.writeInt(obj.colorCode);
    writer.writeBool(obj.isArebic);
    writer.writeStringList(obj.arSimilarWords);
    writer.writeStringList(obj.enSimilarWords);
    writer.writeStringList(obj.arExamples);
    writer.writeStringList(obj.enExamples);
  }
}
