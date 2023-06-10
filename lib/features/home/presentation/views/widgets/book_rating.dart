import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double rate;
  final int count;

  const BookRating({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rate,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          size: 14,
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "$rate",
          style: StyleManager.titleStyle16,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "($count)",
            style:
                StyleManager.titleStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
