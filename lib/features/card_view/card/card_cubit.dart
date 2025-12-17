import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/features/card_view/card/card_state.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';

class CardItemCubit extends Cubit<CardItemState> {
  CardItemCubit() : super(CardItemState());

  void addCardItem({required ProductInputEntities productInputEntities}) {
    print('lol added to cart');
    if (state.cardItemEntitys.isEmpty) {
      CardItemEntity cardItemEntity =
          CardItemEntity(product: productInputEntities, count: 1);
      state.cardItemEntitys = [...state.cardItemEntitys, cardItemEntity];
      emit(state.copyWith(cardItemEntitys: state.cardItemEntitys));
      return;
    }
    state.cardItemEntitys.forEach((element) {
      if (element.product == productInputEntities) {
        print('lol exist');
        int indexProduct = state.cardItemEntitys.indexOf(element);
        var existingItem = state.cardItemEntitys[indexProduct];
        var updateProduct = CardItemEntity(
          product: existingItem.product,
          count: existingItem.count + 1,
        );
        state.cardItemEntitys[indexProduct] = updateProduct;
        // element.increaseCount();
        emit(state.copyWith(cardItemEntitys: state.cardItemEntitys));
      } else {
        state.cardItemEntitys = [
          ...state.cardItemEntitys,
          CardItemEntity(product: productInputEntities, count: 1)
        ];
        // or uese this line
        // final updatedCardItems = List.of(state.cardItemEntitys)..add(cardItemEntity);
        emit(state.copyWith(cardItemEntitys: state.cardItemEntitys));
        print('lol not exist');
      }
    });
    // if (state.cardItemEntitys.contains(productInputEntities)) {
    //   // if (state.cardItemsEntity
    //   //     .any((item) => item.product.code == cardItemEntity.product.code)) {
    //   //   final index = state.cardItemsEntity.indexOf(
    //   //       cardItemEntity.product.code.contains(cardItemEntity.product.code)
    //   //           ? state.cardItemsEntity.firstWhere(
    //   //               (item) => item.product.code == cardItemEntity.product.code)
    //   //           : CardItemEntity(product: cardItemEntity.product));
    //   //   final existingItem = state.cardItemsEntity[index];
    //   //   final updatedItem = CardItemEntity(
    //   //     product: existingItem.product,
    //   //     count: existingItem.count + cardItemEntity.count,
    //   //   );
    //   //   state.cardItemsEntity[index] = updatedItem;
    //   //   emit(state.copyWith(cardItemsEntity: state.cardItemsEntity));
    //   //   return;
    // } else {
    //   state.productInputEntities = [
    //     ...state.productInputEntities,
    //     productInputEntities
    //   ];
    //   // or uese this line
    //   // final updatedCardItems = List.of(state.productInputEntities)..add(cardItemEntity);
    //   emit(state.copyWith(productInputEntities: state.productInputEntities));
    // }
  }
}
