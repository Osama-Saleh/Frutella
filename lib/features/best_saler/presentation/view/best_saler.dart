import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/utils/app_images.dart';

class BestSalerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BestSalerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('الأكثر مبيعًا'),
      centerTitle: true,
      
      actions: [
        Container(
            margin: EdgeInsets.only(left: 10.w),
            child: CircleAvatar(
            radius: 22.r,
            backgroundColor: Color(0xffEEF8ED),
            child: SvgPicture.asset(
              Assets.imagesHomeNotification,
              width: 25.w,
            )),
          )
      ],
      leading: Center(
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => Size(200, kToolbarHeight);
}
class BestSaler extends StatelessWidget {
  const BestSaler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BestSalerAppBar(),
      body: Center(
        child: Text('Best Saler View'),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('الأكثر مبيعًا'),
      centerTitle: true,
      
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
          radius: 22.r,
          backgroundColor: Color(0xffEEF8ED),
          child: SvgPicture.asset(
            Assets.imagesHomeNotification,
            width: 25.w,
          )),
        )
      ],
      leading: Center(
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
