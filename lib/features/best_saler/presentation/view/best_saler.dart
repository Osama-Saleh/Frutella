import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/cubit/products_cubit/products_cubit.dart';
import 'package:fruit/core/repos/product_repo/product_repo.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/features/best_saler/presentation/wigets/best_saller_view_body.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isHaveArrorBack;
  const CustomAppBar(
      {Key? key, required this.title, this.isHaveArrorBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
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
      leading: isHaveArrorBack == true
          ? Center(
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
            )
          : null,
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
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
        child: BestSallerViewBody(),
      ),
    );
  }
}
