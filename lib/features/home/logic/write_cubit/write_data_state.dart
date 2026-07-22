part of 'write_data_cubit.dart';

abstract class WriteDataState {}

final class WriteDataInitial extends WriteDataState {}

final class WriteDataLoading extends WriteDataState {}

final class WriteDataSuccess extends WriteDataState {}

final class WriteDataFailuer extends WriteDataState {
  final String errMesssage;

  WriteDataFailuer({required this.errMesssage});
}
