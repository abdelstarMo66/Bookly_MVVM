import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  final Item book;
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.20),
          child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ""),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Text(
          book.volumeInfo.title,
          textAlign: TextAlign.center,
          style: StyleManager.titleStyle30,
        ),
        const SizedBox(
          height: 4.0,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors[0],
            style: StyleManager.titleStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rate: book.volumeInfo.averageRating ?? 0.0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 27.0,
        ),
        BooksAction(book: book),
      ],
    );
  }
}
