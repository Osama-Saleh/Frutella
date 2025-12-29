part of 'check_order_cubit.dart';
enum CheckOrderStatus { initial, loading, success, failure }
class CheckOrderState {
  final CheckOrderStatus checkOrderStatus;
  final String? errorMessage;

   CheckOrderState({
    this.checkOrderStatus = CheckOrderStatus.initial,
    this.errorMessage,
  });


  CheckOrderState copyWith({
    CheckOrderStatus? checkOrderStatus,
    String? errorMessage,
  }) {
    return CheckOrderState(
      checkOrderStatus: checkOrderStatus ?? this.checkOrderStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}