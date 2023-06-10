import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure("Connection Time Out With API Server");

      case DioErrorType.sendTimeout:
        return ServerFailure("Send Time Out With API Server");

      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive Time Out With API Server");

      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure("Request to API Server Cancel");

      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        } else {
          return ServerFailure("UnException Error, please try again");
        }

      default:
        return ServerFailure(
            "Ops!! There Was An Error, please try again later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request Not Found, please try again later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, please try again later!");
    } else {
      return ServerFailure("Ops!! There Was An Error, please try again later!");
    }
  }
}
