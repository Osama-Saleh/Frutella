import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/home/presentation/widgets/feature_item.dart';

class FeatureItemsList extends StatelessWidget {
  const FeatureItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 130.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => FeatureItem(),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15.w,
                      ),
                      itemCount: 4,
                    ),
                  );
  }
}