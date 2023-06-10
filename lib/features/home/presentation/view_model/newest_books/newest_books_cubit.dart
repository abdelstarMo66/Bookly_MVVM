import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitialState());

  static NewestBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((failure) {
      emit(NewestBooksErrorState(failure.errorMessage));
    }, (books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}
