import 'package:flutter/material.dart';

class ShowErrorMessage extends StatelessWidget {
  final String errorMessage;
  const ShowErrorMessage({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
