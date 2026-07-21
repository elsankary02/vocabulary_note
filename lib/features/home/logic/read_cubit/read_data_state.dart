part of 'read_data_cubit.dart';

abstract class ReadDataState {}

final class ReadDataInitial extends ReadDataState {}

final class ReadDataLoading extends ReadDataState {}

final class ReadDataSuccess extends ReadDataState {
  final List<WordModel> words;

  ReadDataSuccess({required this.words});
}

final class ReadDataFailuer extends ReadDataState {
  final String errMesssage;

  ReadDataFailuer({required this.errMesssage});
}
