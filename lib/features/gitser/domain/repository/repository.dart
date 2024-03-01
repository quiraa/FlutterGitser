import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';

abstract class Repository {
  Future<DataState<List<UserResponseItem>>> getAllUsers();

  Future<DataState<DetailResponse>> getUserDetail(
    String username,
  );

  Future<DataState<SearchResponse>> searchUserByUsername(
    String username,
  );

  Future<DataState<List<UserResponseItem>>> getUserFollowers(
    String username,
  );

  Future<DataState<List<UserResponseItem>>> getUserFollowing(
    String username,
  );
}
