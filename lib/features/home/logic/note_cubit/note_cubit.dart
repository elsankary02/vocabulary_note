import 'package:flutter_bloc/flutter_bloc.dart';

part 'note_state.dart';

class NoteCubieCubit extends Cubit<NoteCubieState> {
  NoteCubieCubit() : super(NoteCubieInitial());
}
