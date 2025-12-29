import 'package:bloc/bloc.dart';
import 'package:fruit/core/repos/orders/order_repo.dart';
import 'package:fruit/core/repos/orders/order_repo_imple.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';

part 'check_order_state.dart';

class CheckOrderCubit extends Cubit<CheckOrderState> {
  CheckOrderCubit(this.orderRepo) : super(CheckOrderState());
  final OrderRepo orderRepo;

  Future<void> addOrder({required CheckOrderEntity checkOrderEntity}) async {
    try {
      emit(state.copyWith(checkOrderStatus: CheckOrderStatus.loading));
      await orderRepo.addProduct(checkOrderEntity: checkOrderEntity);
      emit(state.copyWith(checkOrderStatus: CheckOrderStatus.success));
    } catch (e) {
      emit(state.copyWith(
          checkOrderStatus: CheckOrderStatus.failure,
          errorMessage: e.toString()));
    }
  }
}
