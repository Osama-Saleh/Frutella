import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/app_constant/app_constant.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
import 'package:fruit/core/services/shared_prefrences.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/on_boarding/presentation/view/widgets/custom_page1.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? _pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    _pageController?.addListener(() {
      // Gives fractional value while scrolling
      // double? page = _pageController?.page;

      // If you want exact int page index
      int page = _pageController?.page?.round() ?? 0;

      setState(() {
        currentPage = page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
                children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                CustomPage(
                  background: Assets.imagesOnBoardingBackgroundPage1,
                  image: Assets.imagesOnBoardingFruitBasketPage1,
                  title: Text.rich(TextSpan(children: [
                    TextSpan(text: 'مرحبًا بك في ', style: AppTextStyles.bold23),
                    TextSpan(
                        text: 'Fruit',
                        style: AppTextStyles.bold23
                            .copyWith(color: Color(0xffF4A91F))),
                    TextSpan(
                        text: 'HUB',
                        style: AppTextStyles.bold23
                            .copyWith(color: Color(0xff1B5E37))),
                  ])),
                  subtitle:
                      'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                  isSkip: true,
                ),
                CustomPage(
                  background: Assets.imagesOnBoardingBackgroundPage2,
                  image: Assets.imagesOnBoardingFruitBasketPage2,
                  title: Text(
                    ' ابحث وتسوق',
                    style: AppTextStyles.bold23,
                  ),
                  subtitle:
                      'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
                  isSkip: false,
                ),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: 2,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(12.0),
              activeSize: const Size(12.0, 12.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              activeColor: Colors.green,
              color: currentPage == 0
                  ? const Color.fromARGB(255, 185, 243, 155)
                  : const Color.fromARGB(255, 2, 125, 11),
            ),
          ),
          Visibility(
            visible: currentPage != 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, OnGenerateRout.homeView);
                  SharedPrefrencesService.setBool(AppConstant.onBoardingKey, true);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1B5E37),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                ),
                child: Text(
                  'ابدأ الان',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
                ],
              ),
        ));
  }
}
