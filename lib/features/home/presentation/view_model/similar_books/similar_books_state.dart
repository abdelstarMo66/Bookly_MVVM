import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksStates extends Equatable {
  const SimilarBooksStates();
  @override
  List<Object> get props => [];
}

class SimilarBooksInitialState extends SimilarBooksStates {}

class SimilarBooksLoadingState extends SimilarBooksStates {}

class SimilarBooksSuccessState extends SimilarBooksStates {
  final BookModel books;

  const SimilarBooksSuccessState(this.books);
}

class SimilarBooksErrorState extends SimilarBooksStates {
  final String errorMessage;

  const SimilarBooksErrorState(this.errorMessage);
}
