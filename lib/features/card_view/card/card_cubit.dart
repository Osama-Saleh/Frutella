import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/entities/add_product_input_entities.dart';
import 'package:fruit/features/card_view/card/card_state.dart';
import 'package:fruit/features/card_view/domain/card_item_entity.dart';

class CardItemCubit extends Cubit<CardItemState> {
  CardItemCubit() : super(CardItemState());

  void addCardItem({required ProductInputEntities productInputEntities}) {
    final index = state.cardItemEntitys.indexWhere(
      (item) => item.product == productInputEntities,
    );
    if (index >= 0) {
      final existing = state.cardItemEntitys[index];
      final updated = CardItemEntity(
        product: existing.product,
        count: existing.count + 1,
      );
      final updatedList = List<CardItemEntity>.from(state.cardItemEntitys)
        ..[index] = updated;
      emit(state.copyWith(cardItemEntitys: updatedList));
      print('increased count to ${updated.count}');
    } else {
      final newItem = CardItemEntity(product: productInputEntities, count: 1);
      final updatedList = List<CardItemEntity>.from(state.cardItemEntitys)
        ..add(newItem);
      emit(state.copyWith(cardItemEntitys: updatedList));
      print('added new item (count: 1)');
    }
  }
void updateCardItem({required ProductInputEntities productInputEntities}) {
    final index = state.cardItemEntitys.indexWhere(
      (item) => item.product == productInputEntities,
    );
    if (index >= 0) {
      final existing = state.cardItemEntitys[index];
      final updated = CardItemEntity(
        product: existing.product,
        count: existing.count + 1,
      );
      final updatedList = List<CardItemEntity>.from(state.cardItemEntitys)
        ..[index] = updated;
      emit(state.copyWith(isUpdateCard: true));
    }
  }

  void decreaseCardItem({required ProductInputEntities productInputEntities}) {
    final index = state.cardItemEntitys.indexWhere(
      (item) => item.product == productInputEntities,
    );
    if (index >= 0) {
      final existing = state.cardItemEntitys[index];
      final updated = CardItemEntity(
        product: existing.product,
        count: existing.count - 1,
      );
      final updatedList = List<CardItemEntity>.from(state.cardItemEntitys)
        ..[index] = updated;
      emit(state.copyWith(cardItemEntitys: updatedList));
    }
  }

  void removeCardItem({required ProductInputEntities productInputEntities}) {
    state.cardItemEntitys.removeWhere(
      (item) => item.product == productInputEntities,
    );
    emit(state.copyWith(cardItemEntitys: state.cardItemEntitys));
    // final index = state.cardItemEntitys.indexWhere(
    //   (item) => item.product == productInputEntities,
    // );
    // if (index >= 0) {
    //   final existing = state.cardItemEntitys[index];
    //   if (existing.count > 1) {
    //     final updated = CardItemEntity(
    //       product: existing.product,
    //       count: existing.count - 1,
    //     );
    //     final updatedList = List<CardItemEntity>.from(state.cardItemEntitys)
    //       ..[index] = updated;
    //     emit(state.copyWith(cardItemEntitys: updatedList));
    //     print('decreased count to ${updated.count}');
    //   } else {
    //     final updatedList = List<CardItemEntity>.from(state.cardItemEntitys)
    //       ..removeAt(index);
    //     emit(state.copyWith(cardItemEntitys: updatedList));
    //     print('removed item from cart');
    //   }
    // }
  }
}
