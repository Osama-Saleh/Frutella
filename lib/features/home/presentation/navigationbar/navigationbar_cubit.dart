import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigationbar_state.dart';

class NavigationbarCubit extends Cubit<int> {
  NavigationbarCubit() : super(0);
  int index = 0;
  changeIndex(int index) {
    this.index = index;
    emit(this.index);
  }
  
}
