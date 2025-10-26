import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigationbar_state.dart';

class NavigationbarCubit extends Cubit<int> {
  NavigationbarCubit() : super(0);

  changeIndex(int index) {
    emit(index);
  }
  
}
