import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        Assets.imagesHomeProfileImage,
        width: 45.w,
        height: 45.w,
        fit: BoxFit.fill
      ),
      trailing: CircleAvatar(
          radius: 22.r,
          backgroundColor: Color(0xffEEF8ED),
          child: SvgPicture.asset(
            Assets.imagesHomeNotification,
            width: 25.w,
          )),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(
          color: AppColors.grayColor,
        ),
      ),
      subtitle: Text('أسامة صالح',
          style: AppTextStyles.bold16.copyWith(
            color: Colors.black,
          )),
    );
  }
}
