import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_colors.dart';

class Active extends StatelessWidget {
  final String ActiveImage, label;
  const Active({
    super.key,
    this.ActiveImage = '',
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: ShapeDecoration(
            color: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.w,
              margin: EdgeInsetsDirectional.only(end: 6.w),
              decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  )),
              child: Center(
                child: SvgPicture.asset(
                  ActiveImage,
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 6.w,
            )
          ],
        ),
      ),
    );
  }
}
