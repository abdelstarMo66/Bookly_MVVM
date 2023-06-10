import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({Key? key, required this.errorMessage})
      : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: StyleManager.titleStyle18,
    );
  }
}
