import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/repository_response.dart';

abstract class RepositoryState {
  final List<RepositoryResponse>? response;
  final DioException? error;

  const RepositoryState({this.error, this.response});
}

class RepositoryLoadingState extends RepositoryState {
  const RepositoryLoadingState();
}

class RepositoryErrorState extends RepositoryState {
  const RepositoryErrorState(DioException error) : super(error: error);
}

class RepositorySuccessState extends RepositoryState {
  const RepositorySuccessState(List<RepositoryResponse> response)
      : super(response: response);
}
