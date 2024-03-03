import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_response.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class SearchUsersUseCase
    implements UseCase<DataState<SearchResponse>, SearchUsersParams> {
  final Repository repository;

  SearchUsersUseCase(this.repository);

  @override
  Future<DataState<SearchResponse>> call({SearchUsersParams? params}) {
    return repository.searchUserByUsername(
      params!.query!,
    );
  }
}

class SearchUsersParams {
  final String? query;

  SearchUsersParams({
    this.query,
  });
}
