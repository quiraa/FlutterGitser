import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class GetUserFollowingUseCase
    implements
        UseCase<DataState<List<UserResponseItem>>, GetUserFollowingParams> {
  final Repository repository;

  GetUserFollowingUseCase(this.repository);

  @override
  Future<DataState<List<UserResponseItem>>> call({
    GetUserFollowingParams? params,
  }) {
    return repository.getUserFollowing(params!.username);
  }
}

class GetUserFollowingParams {
  final String username;

  GetUserFollowingParams(this.username);
}
