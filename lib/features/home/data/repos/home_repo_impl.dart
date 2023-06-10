import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final APIServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=web developer&orderBy=newest");

      late BookModel books;

      books = BookModel.fromJson(data.data);
      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeatureBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&q=programming");

      late BookModel books;

      books = BookModel.fromJson(data.data);
      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=$category&Sorting=relevance");

      late BookModel books;

      books = BookModel.fromJson(data.data);
      return right(books);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
