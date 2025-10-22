import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;


class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       SvgPicture.asset(Assets.imagesOnBoardingFruitBasketPage2),
        Container(  
          width: 200,
          height: 200,
          decoration:BoxDecoration(
            image: DecorationImage(
              image: svgProvider.Svg(Assets.imagesHomeBackgroundFeatersItem),
              fit: BoxFit.fill,
            ),
            
          ) ,
          child: Column(
            children: [
              Text('dasdfta')
            ],
          ),
        ),
      ],
    );
  }
}