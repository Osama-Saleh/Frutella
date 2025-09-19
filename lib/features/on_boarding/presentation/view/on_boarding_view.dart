import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_images.dart';
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
    print('currentPage $currentPage');
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [
              CustomPage(
                background: Assets.imagesOnBoardingBackgroundPage1,
                image: Assets.imagesOnBoardingFruitBasketPage1,
                title: Text('مرحبًا بك في FruitHUB'),
                subtitle:
                    'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                currentPage: currentPage,
              ),
              CustomPage(
                background: Assets.imagesOnBoardingBackgroundPage2,
                image: Assets.imagesOnBoardingFruitBasketPage2,
                title: Text('مرحبًا بك في FruitHUB'),
                subtitle:
                    'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                currentPage: currentPage,
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
      ],
    ));
  }
}
