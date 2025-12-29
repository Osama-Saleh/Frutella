import 'package:fruit/core/app_constant/backend_end_point.dart';
import 'package:fruit/core/helper/custom_error_message.dart';
import 'package:fruit/core/repos/orders/order_repo.dart';
import 'package:fruit/core/services/data_base.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_entity.dart';
import 'package:fruit/features/check_order/presentation/module/order_model.dart';

class OrderRepoImple implements OrderRepo {
  DataBaseServices dataBaseServices;
  OrderRepoImple({required this.dataBaseServices});
  @override
  Future<void> addProduct({required CheckOrderEntity checkOrderEntity}) async {
    try {
      await dataBaseServices.addData(
          path: BackendEndPoint.addOrderPath,
          data: OrderModel.fromEntity(checkOrderEntity).toJson());
    } catch (e) {
      ShowErrorMessage(errorMessage: e.toString());
    }
  }
}
