import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InActive extends StatelessWidget {
  final String inActiveImage;
  const InActive({
    super.key,
    this.inActiveImage = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            inActiveImage,
          ),
        ],
      ),
    );
  }
}
