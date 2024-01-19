import 'package:dio/dio.dart';


abstract class Failure{
  final String errMessage;

  Failure({required this.errMessage});
}
class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException){
    switch(dioException.type){

      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout With ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to Api was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Failed to connect to the server');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(errMessage: 'errMessage');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode,dynamic response){
    if(statusCode==400||statusCode==401||statusCode==403){
      return ServerFailure(errMessage: response['error']['message']);
    }else if(statusCode==404){
      return ServerFailure(errMessage: 'Your request not found, Please try later!');
    }else if(statusCode==500){
      return ServerFailure(errMessage: 'Internal Server Error, Please try later!');
    }else{
      return ServerFailure(errMessage: 'Oops There was an Error, Please try again');
    }
  }
}