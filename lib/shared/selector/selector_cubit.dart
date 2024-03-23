import 'package:bloc/bloc.dart';

class SelectorCubit extends Cubit<int?> {
  SelectorCubit() : super(null);
  set(int index) => emit(index);
  update() => emit(state);
}
