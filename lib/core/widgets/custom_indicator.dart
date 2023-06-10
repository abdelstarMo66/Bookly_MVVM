import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.8,
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
