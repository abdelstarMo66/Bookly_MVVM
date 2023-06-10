import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBooksStates extends Equatable {
  const NewestBooksStates();
  @override
  List<Object> get props => [];
}

class NewestBooksInitialState extends NewestBooksStates {}

class NewestBooksLoadingState extends NewestBooksStates {}

class NewestBooksSuccessState extends NewestBooksStates {
  final BookModel books;

  const NewestBooksSuccessState(this.books);
}

class NewestBooksErrorState extends NewestBooksStates {
  final String errorMessage;

  const NewestBooksErrorState(this.errorMessage);
}
