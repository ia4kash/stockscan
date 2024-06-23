import 'package:stockscan/utils/exception_handler.dart';

class RepoResponse<T> {
  final APIException? error;
  final T? data;

  RepoResponse({this.error, this.data});
}
