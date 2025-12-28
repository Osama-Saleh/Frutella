import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/card_view/card/card_cubit.dart';
import 'package:fruit/features/card_view/card/card_state.dart';
import 'package:fruit/features/check_order/presentation/widgets/shipping_item.dart';

class ShippingSections extends StatefulWidget {
    final ValueChanged<int>? onSelectionChanged;

  const ShippingSections({super.key, this.onSelectionChanged});

  @override
  State<ShippingSections> createState() => _ShippingSectionsState();
}

class _ShippingSectionsState extends State<ShippingSections>
    with AutomaticKeepAliveClientMixin {
  int selectIndex = -1;
  @override
  Widget build(BuildContext context) {
    var cardItemState = context.read<CardItemCubit>().state;
    super.build(context);
    return BlocBuilder<CardItemCubit, CardItemState>(
      builder: (context, state) {
        return Column(
          spacing: 12.h,
          children: [
            SizedBox(height: 8.h),
            ShippingItem(
              title: 'الدفع عند الاستلام',
              subtitle: 'التسليم من المكان',
              price: cardItemState.totalPrice.toString(),
              isSelected: selectIndex == 0,
              onTap: () {
                selectIndex = 0;
                widget.onSelectionChanged?.call(selectIndex);
                setState(() {});
              },
            ),
            ShippingItem(
              title: 'الدفع اونلاين',
              subtitle: 'التسليم من المكان',
              price: cardItemState.totalPrice.toString(),
              isSelected: selectIndex == 1,
              onTap: () {
                selectIndex = 1;
                widget.onSelectionChanged?.call(selectIndex);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
