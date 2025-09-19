import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/utils/app_images.dart';

class CustomPage extends StatelessWidget {
  final String background;
  final String image;
  final Widget title;
  final String subtitle;
  final int currentPage;

  const CustomPage({super.key,
  required this.background,
  required this.image,
  required this.title,
  required this.subtitle,
  required this.currentPage
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    background,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
                Visibility(
                  visible: currentPage==0,
                  child: Text('تخطي'))
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.07),
          title,
          SizedBox(height: MediaQuery.sizeOf(context).height*0.04),
          Text(subtitle),
        ],
            ),
      ),
    );
  }
}
