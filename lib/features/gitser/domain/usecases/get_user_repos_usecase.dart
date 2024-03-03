import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/repository_response.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class GetUserReposUseCase
    implements
        UseCase<DataState<List<RepositoryResponse>>, GetUserReposParams> {
  final Repository repository;

  GetUserReposUseCase(this.repository);

  @override
  Future<DataState<List<RepositoryResponse>>> call({
    GetUserReposParams? params,
  }) {
    return repository.getUserRepositories(params!.username);
  }
}

class GetUserReposParams {
  final String username;

  GetUserReposParams(this.username);
}
