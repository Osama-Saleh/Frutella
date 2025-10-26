part of 'navigationbar_cubit.dart';

 class NavigationbarState {

  int selectedIndex = 0;

  NavigationbarState({required this.selectedIndex});

  NavigationbarState copyWith({int? selectedIndex}) {
    return NavigationbarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
  
}
