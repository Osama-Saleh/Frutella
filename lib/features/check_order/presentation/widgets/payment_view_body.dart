import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/check_order/presentation/module/check_order_model.dart';
import 'package:fruit/features/check_order/presentation/widgets/delever_location.dart';
import 'package:fruit/features/check_order/presentation/widgets/sammary_order.dart';

class PaymentViewBody extends StatelessWidget {
  CheckOrderModel? checkOrderModel;
  PaymentViewBody({super.key, this.checkOrderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        SammaryOrder(
          price: checkOrderModel?.cardItemEntitys
                  ?.fold(0, (sum, item) => sum! + item.calculateTotalPrice) ??
              0,
        ),
        DeleverLocation(
          checkOrderAddressModel: checkOrderModel!.checkOrderAddressModel!,
        ),
      ],
    );
  }
}
