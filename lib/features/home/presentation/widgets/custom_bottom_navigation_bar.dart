import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 70.h, 
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            )
            
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 25,
              offset: Offset(-5, -1),
            ),
          ],
          ),
                );
  }
}