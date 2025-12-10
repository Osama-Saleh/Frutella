import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/home/domain/entites/buttom_navigation_bar_entites.dart';
import 'package:fruit/features/home/presentation/navigationbar/navigationbar_cubit.dart';
import 'package:fruit/features/home/presentation/widgets/active_widget.dart';
import 'package:fruit/features/home/presentation/widgets/in_active_widget.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationbarCubit, int>(
      builder: (context, state) {
        return Container(
          height: 60.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            )),
            shadows: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 25,
                offset: Offset(-5, -1),
              ),
            ],
          ),
          child: Row(
            children: ButtomNavigationBarEntites.buttomNavigationBarItems
                .asMap()
                .entries
                .map(
              (e) {
                int index = e.key;
                String label = e.value.label;
                return Expanded(
                  flex: index == state ? 5 : 3,
                  child: GestureDetector(
                    onTap: () {
                      context.read<NavigationbarCubit>().changeIndex(index);
                    },
                    child: index == state
                        ? Active(
                            ActiveImage: ButtomNavigationBarEntites
                                .buttomNavigationBarItems[index].activeImage,
                            label: label,
                          )
                        : InActive(
                            inActiveImage: ButtomNavigationBarEntites
                                .buttomNavigationBarItems[index].inActiveImage,
                          ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
