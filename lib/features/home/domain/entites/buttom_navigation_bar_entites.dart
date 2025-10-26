import 'package:fruit/core/utils/app_images.dart';

class ButtomNavigationBarEntites {
  final String label , activeImage , inActiveImage;

  ButtomNavigationBarEntites({
    required this.label,
    required this.activeImage,
    required this.inActiveImage,
  });
 static List <ButtomNavigationBarEntites> buttomNavigationBarItems = [
  ButtomNavigationBarEntites(
    label: "الرئيسية",
    activeImage: Assets.imagesHomeHomeActive,
    inActiveImage: Assets.imagesHomeHome,
  ),
  ButtomNavigationBarEntites(
    label: "المنتجات",
    activeImage: Assets.imagesHomeProductActive,
    inActiveImage: Assets.imagesHomeProducts,
  ),
  ButtomNavigationBarEntites(
    label: "سلة التسوق",
    activeImage: Assets.imagesHomeShoppingCartActive,
    inActiveImage: Assets.imagesHomeShoppingCart,
  ),
  ButtomNavigationBarEntites(
    label: "حسابي",
    activeImage: Assets.imagesHomeMyAccountActive,
    inActiveImage: Assets.imagesHomeMyAccount,
  ),
];
}


