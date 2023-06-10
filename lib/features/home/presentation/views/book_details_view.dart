import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_model/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/similar_books/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  final Item book;
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SimilarBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchSimilarBooks(
              // Todo Error
              category: book.volumeInfo.categories![0],
            ),
      child: Scaffold(
        body: SafeArea(
          child: BookDetailsViewBody(
            book: book,
          ),
        ),
      ),
    );
  }
}
