import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_books/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_books/feature_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/service_locator.dart';
import 'custom_book_image.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FeatureBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeatureBooks(),
      child: BlocBuilder<FeatureBooksCubit, FeatureBooksStates>(
        builder: (context, state) {
          if (state is FeatureBooksSuccessState) {
            BookModel books = state.books;
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: books.items!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books.items![index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl: books
                            .items![index].volumeInfo.imageLinks?.thumbnail ??
                            " ",
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is FeatureBooksErrorState) {
            return CustomErrorMessage(errorMessage: state.errorMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
