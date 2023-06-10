import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBooksStates extends Equatable {
  const FeatureBooksStates();
  @override
  List<Object> get props => [];
}

class FeatureBooksInitialState extends FeatureBooksStates {}

class FeatureBooksLoadingState extends FeatureBooksStates {}

class FeatureBooksSuccessState extends FeatureBooksStates {
  final BookModel books;

  const FeatureBooksSuccessState(this.books);
}

class FeatureBooksErrorState extends FeatureBooksStates {
  final String errorMessage;

  const FeatureBooksErrorState(this.errorMessage);
}
