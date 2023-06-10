import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  final Item book;
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(book: book),
                const Expanded(
                  child: SizedBox(
                    height: 10.0,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
