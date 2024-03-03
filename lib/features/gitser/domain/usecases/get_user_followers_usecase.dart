import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class GetUserFollowersUseCase
    implements
        UseCase<DataState<List<UserResponseItem>>, GetUserFollowersParams> {
  final Repository repository;

  GetUserFollowersUseCase(this.repository);

  @override
  Future<DataState<List<UserResponseItem>>> call({
    GetUserFollowersParams? params,
  }) {
    return repository.getUserFollowers(params!.username);
  }
}

class GetUserFollowersParams {
  final String username;

  GetUserFollowersParams(this.username);
}
