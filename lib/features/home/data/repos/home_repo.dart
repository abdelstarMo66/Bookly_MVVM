// بحدد هنا انا بعمل ايه بس منغير implementation (مش بحدد بيعتمل ازاي)
// كده انا بجبر اي شخص هيستخدم ال homeRepo انه يعمل implement للفانكشن الي انا محددها
// بس مليش دعوه بالطريقه الي هو هيكتبها بيها

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // dart >= 3 support return two objects
  Future<Either<Failure, BookModel>> fetchNewestBooks();
  Future<Either<Failure, BookModel>> fetchFeatureBooks();
  Future<Either<Failure, BookModel>> fetchSimilarBooks({required String category});
}
