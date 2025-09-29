import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

class SocialMedia extends StatelessWidget {
  final String svgImage;
  final String title;
  final Function()? onTap;
  const SocialMedia({
    super.key,
    required this.svgImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Color(0xffE6E9EA)),
      ),
      leading: SvgPicture.asset(
        svgImage,

      ),
      title: Text(title,
          textAlign: TextAlign.center,
          style: AppTextStyles.bold16,),
      onTap: () {},
    );
  }
}
