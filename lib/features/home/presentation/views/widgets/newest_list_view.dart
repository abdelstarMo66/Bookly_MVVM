import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/service_locator.dart';
import 'book_list_view_item.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NewestBooksCubit(getIt.get<HomeRepoImpl>())
        ..fetchNewestBooks(),
      child: BlocBuilder<NewestBooksCubit, NewestBooksStates>(
        builder: (context, state) {
          if (state is NewestBooksSuccessState){
            BookModel books = state.books;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true, // height the children & build all list before viewing and the solve it wrap list SliverFillRemaining in CustomScrollView (best for performance)
              padding: EdgeInsets.zero,
              itemCount: books.items!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BookListViewItem(bookItem: books.items![index]),
              ),

            );
          }
          else if (state is NewestBooksErrorState){
            return CustomErrorMessage(errorMessage: state.errorMessage);
          }
          else{
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
