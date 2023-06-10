import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksStates> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitialState());

  static FeatureBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeatureBooksLoadingState());
    var result = await homeRepo.fetchFeatureBooks();

    result.fold((failure) {
      emit(FeatureBooksErrorState(failure.errorMessage));
    }, (books) {
      emit(FeatureBooksSuccessState(books));
    });
  }
}
