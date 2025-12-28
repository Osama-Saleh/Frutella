import 'package:fruit/core/entities/add_product_input_entities.dart';

class CardItemEntity {
  final ProductInputEntities product;
  int count;

  CardItemEntity({
    required this.product,
    this.count = 0,
  });

  num get calculateTotalPrice => product.price * count;
  num get calculateTotalWeight => product.unitCount * count;
  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }

  calculateTotalPriceWithCount(int newCount) {
    return product.price * newCount;
  }
}
